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

# FUNCTION_REGEX = /^.*?(unsigned|signed)?\s*((s_|sf)\w+|_s|_t|void|int|char|short|long|float|double|bool|size_t)\s+((\w|\*)+)\s*\([^)]*(,\n|\)[^;]\s*)/
# FUNCTION_REGEX_V2_OMG = /^\w*[ ]*(?:unsigned|signed)?[ \t]*(?:(?:s_|sf)\w+|[A-Z]|s_|_t|void|int|char|short|long|float|double|bool|size_t)\s+\**(?:\w+)\s*\([^;]*?{/m
FUNCTION_REGEX_V2_OMG = /^(?:\w*[ ]*(?:unsigned|signed)?[ \t]*\w\s+\**)+(\w+)\s*\([^;]*?{/m

class FileCoherence < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, comments : Set(Comment), content : String, lines : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new
    function_count : Int32 = 0

    content.scan(FUNCTION_REGEX_V2_OMG).each { |match|
      function_count += 1
      if function_count > 5
        row, _ = get_row_column(lines, match.begin)
        errors.add(CodingStyleErrorInfo.new(self, file_path, row, -1))
      end
    }
    errors
  end
end
