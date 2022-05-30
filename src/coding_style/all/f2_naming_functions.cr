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

# TODO: Improve this regex)
FUNCTION_NAME_REGEX             = /^.*?\s*(?:unsigned|signed)?\s*(?:[A-Z]|\w*_t|s_\w*|void|int|char|short|long|float|double)\s+((\w|\*)+)\s*\([^)]*\)/m
SNAKE_CASE_IGNORE_POINTER_REGEX = /^[*]*[a-z]+(?:_[a-z0-9]+)*$/m

class NamingFunctions < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, content : String, options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new


    content.scan(FUNCTION_NAME_REGEX).each { |match|
      if match.captures[0] !~ SNAKE_CASE_IGNORE_POINTER_REGEX
        row, column = get_row_column(content.split("\n"), match.end)
        errors.add(CodingStyleErrorInfo.new(self, file_path, row, column))
      end
    }
    errors
  end
end
