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

# TODO: Add check for struct
CURLY_BRACKETS_STATEMENTS_REGEX = /([\s]*}[\s]*|[\s]*)(else[\s]*if|[^\w]+if|for|while|switch|else|do)(\s*\(.*\)([ ]*|\))\n|[\s]*\n)[\s]*{/
#CURLY_BRACKETS_FUNCTIONS_REGEX  = /^.*?\s*(unsigned|signed)?\s*([A-Z]|\w*_t|s_\w*|void|int|char|short|long|float|double)\s+((\w|\*)+)\s*\([^)]*\)[^\S\r\n]*{/m
CURLY_BRACKETS_FUNCTIONS_REGEX  = /^(?:\w*[ ]*(?:unsigned|signed)?[ \t]*\w\s+\**)+\w+\s*\([^{]*\)[ \r]*{/m

class CurlyBrackets < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, content : String, lines : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new

    content.scan(Regex.union(CURLY_BRACKETS_STATEMENTS_REGEX, CURLY_BRACKETS_FUNCTIONS_REGEX)).each { |match|
      row, column = get_row_column(lines, match.end)
      errors.add(CodingStyleErrorInfo.new(self, file_path, row, column))
    }
    errors
  end
end
