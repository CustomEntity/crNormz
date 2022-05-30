#MIT License
#
#Copyright (c) 2022 CustomEntity
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
require "../coding_style"
require "../../file/file_manager"

# Thanks Léo for this regex <3
FUNCTION_REGEX = /^.*?(unsigned|signed)?\s*((s_|sf)\w+|_s|_t|void|int|char|short|long|float|double|bool|size_t)\s+((\w|\*)+)\s*\([^)]*(,\n|\)[^;]\s*)/

class FileCoherence < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, content : String, options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new
    lines = File.read(file_path).split("\n").map {|line| line + "\n"}
    function_count : Int32 = 0
    curr_line = 1

    lines.each {|line|
      if line =~ FUNCTION_REGEX
        function_count += 1
        if function_count > 5
          errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line, -1))
        end
      end
      curr_line += 1
    }
    errors
  end
end
