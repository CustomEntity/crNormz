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

FUNCTION_DECLARATION_REGEX = /^(?:\w*[ ]*(?:unsigned|signed)?[ \t]*\w\s+\**)+\w+\s*\([^;]*?{/

class LinesNumber < CodingStyle 
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, comments : Set(Comment), content : String, lines : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new

    content.scan(FUNCTION_DECLARATION_REGEX).each { |match|
      row, _ = self.get_row_column(lines, match.end)
      indent_level = 1
      line_count = 0

      (row...lines.size).each { |i|
        indent_level += lines[i].count("{")
        if lines[i] =~ /}/
          indent_level -= lines[i].count("}")
          if indent_level <= 0
            break
          end
        end
        line_count += 1
        if line_count > 20
          errors.add(CodingStyleErrorInfo.new(self, file_path, i + 1, -1))
        end
      }
    }
    errors
  end
end
