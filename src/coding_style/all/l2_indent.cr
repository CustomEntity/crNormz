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

# TO IMPROVE (More precision on functions with level)

class Indent < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, content : String, lines : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new
    curr_line = 1
    bad_indent_name : String
    good_indent_char : Char
    bad_indent_regex : Regex
    indent_incr : Int32

    if get_file_type(file_path) == FileType::Makefile
      bad_indent_name = "Spaces"
      good_indent_char = '\t'
      indent_incr = 4
      bad_indent_regex = /^ +.*$/
    else
      bad_indent_name = "Tabulations"
      good_indent_char = ' '
      bad_indent_regex = /^\t+.*$/
      indent_incr = 1
    end
    content.each_line { |line|
      curr_indent = 0
      while curr_indent < line.size && line[curr_indent] == good_indent_char
        curr_indent += indent_incr
      end
      if line =~ bad_indent_regex
        errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line, -1, " (#{bad_indent_name} are not allowed)".magenta))
      elsif curr_indent % 4 != 0
        errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line, -1, " (Bad indentation)".magenta))
      end
      curr_line += 1
    }
    errors
  end
end
