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

SEVERAL_ASSIGNMENT_REGEX       = /([\w].*[\s]*=[\s]*[\w]*){2,}.*;/
CONDITION_AND_ASSIGNMENT_REGEX = /(if.*[^&|=^><+\-*%\/!]=[^=].*==.*)|(if.*==.*[^&|=^><+\-*%\/!]=[^=].*)/
SEVERAL_SEMI_COLONS            = /\s*(?:.*;.*){2,}/

class CodeLineContent < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, content : String, lines : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new

    content.scan(SEVERAL_ASSIGNMENT_REGEX).each { |match|
      if match[0] !~ /#define|for[\s]*\(/
        row, column = get_row_column(lines, match.begin)
        errors.add(CodingStyleErrorInfo.new(self, file_path, row, column, " (Several assignments on the same line)".magenta))
      end
    }
    content.scan(CONDITION_AND_ASSIGNMENT_REGEX).each { |match|
      row, _ = get_row_column(lines, match.begin)
      errors.add(CodingStyleErrorInfo.new(self, file_path, row, -1, " (Condition and an assignment on the same line)".magenta))
    }
    content.scan(SEVERAL_SEMI_COLONS).each { |match|
      if match[0] !~ /#define|for[\s]*\(/
        row, _ = get_row_column(lines, match.begin)
        errors.add(CodingStyleErrorInfo.new(self, file_path, row + 1, -1, " (Several semi-colons on the same line)".magenta))
      end
    }
    errors
  end
end
