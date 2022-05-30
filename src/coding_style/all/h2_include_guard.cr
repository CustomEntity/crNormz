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

IFNDEF_MACRO_REGEX  = /#ifndef[ ]*(.*)/
HDEFINE_MACRO_REGEX = /#define[ ]*(.*)/
ENDIF_MACRO_REGEX   = /#endif/

class IncludeGuard < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, content : String, options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new

    lines = content.split("\n").map { |line| line + "\n" }
    header_name : String?

    ifndef_match = content.scan(IFNDEF_MACRO_REGEX)
    if ifndef_match.size != 0
      header_name = ifndef_match[0].captures[0].to_s
    end
    define_match = content.scan(HDEFINE_MACRO_REGEX)
    endif_match = content.scan(ENDIF_MACRO_REGEX)
    if ifndef_match.size == 0 || define_match.size == 0 || endif_match.size == 0 || define_match[0].captures[0].to_s != header_name
      errors.add(CodingStyleErrorInfo.new(self, file_path, -1, -1))
    end
    errors
  end
end
