# MIT License
#
# Copyright (c) 2022 CustomEntity
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
require "../coding_style"
require "../../file/file_manager"

# TODO: Handle global constants UPPER_CASE
TYPEDEF_TYPE_NAMES_REGEX     = /typedef.*;/
DEFINE_LOWER_CASE_NAME_REGEX = /#define[\s]*([\w]*)/
ONLY_UPPER_CASE_REGEX        = /^[0-9A-Z_]+$/m
ENUM_DECLARATION_REGEX       = /enum [\w]*\s*{/m

class NamingIdentifiers < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, content : String, lines : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new
    splitted_content = lines

    content.scan(TYPEDEF_TYPE_NAMES_REGEX).each { |match|
      splitted = match[0].split(" ")
      if splitted[-1].chomp(";") !~ /_t$/
        row, column = get_row_column(lines, match.begin)
        errors.add(CodingStyleErrorInfo.new(self, file_path, row, column, " (The type names defined with typedef should end with _t)".magenta))
      end
      if splitted[-1].chomp(";").rstrip !~ SNAKE_CASE_REGEX
        row, column = get_row_column(lines, match.begin)
        errors.add(CodingStyleErrorInfo.new(self, file_path, row, column, " (All identifier names should be according to the snake_case convention)".magenta))
      end
    }
    content.scan(DEFINE_LOWER_CASE_NAME_REGEX).each { |match|
      if match.captures[0] !~ ONLY_UPPER_CASE_REGEX
        row, column = get_row_column(lines, match.begin)
        errors.add(CodingStyleErrorInfo.new(self, file_path, row, column, " (The names of macros should be written in UPPER_CASE)".magenta))
      end
    }
    content.scan(ENUM_DECLARATION_REGEX).each { |match|
      row, column = get_row_column(splitted_content, match.begin)
      curr_line = row
      while !lines[curr_line].includes?("}")
        if lines[curr_line] =~ /[*a-z].*/
          errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line + 1, -1, " (The content of enums should be written in UPPER_CASE)".magenta))
        end
        curr_line += 1
      end
    }

    errors
  end
end
