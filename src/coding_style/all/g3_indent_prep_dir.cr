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

class IndentPrepDir < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, comments : Set(Comment), content : String, lines : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new
    curr_line = 1
    indentation_level = 0
    lines.each { |line|
      if line =~ /^(\s*)#\s*if/
        line_match = line.scan(/^(\s*)#\s*if/)
        if line_match[0].captures[0].to_s.size != indentation_level * 4
          row, column = get_row_column(lines, line_match[0].begin)
          errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line, column + line_match[0].captures[0].to_s.size))
        end
        indentation_level += 1
      elsif line =~ /^(\s*)#\s*endif/
        line_match = line.scan(/^(\s*)#\s*endif/)
        indentation_level -= 1
        if line_match[0].captures[0].to_s.size != indentation_level * 4
          row, column = get_row_column(lines, line_match[0].begin)
          errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line, column + line_match[0].captures[0].to_s.size))
        end
      elsif line =~ /^(\s*)#\s*else|elif/
        line_match = line.scan(/^(\s*)#\s*else|elif/)
        if line_match[0].captures[0].to_s.size != (indentation_level - 1) * 4
          row, column = get_row_column(lines, line_match[0].begin)
          errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line, column + line_match[0].captures[0].to_s.size))
        end
      elsif line =~ /^(\s*)#/
        line_match = line.scan(/^(\s*)#/)
        if line_match[0].captures[0].to_s.size != indentation_level * 4
          row, column = get_row_column(lines, line_match[0].begin)
          errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line, column + line_match[0].captures[0].to_s.size))
        end
      end
      curr_line += 1
    }
    errors
  end
end
