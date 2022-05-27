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

GOTO_REGEX = /[^0-9a-zA-Z_]*goto[^0-9a-zA-Z].*;/

class Goto < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new
    content : String = File.read(file_path)

    content.scan(GOTO_REGEX).each { |match|
      line = 1
      curr_ch = 0
      line_ch = 0
      content.chars.each { |ch|
        if curr_ch != match.begin
          curr_ch += 1
          line_ch += 1
          if ch == '\n'
            line += 1
            line_ch = 0
          end
        end
      }
      errors.add(CodingStyleErrorInfo.new(self, file_path, line, line_ch))
    }
    errors
  end
end

# \/\*\n\*\* EPITECH PROJECT, [0-9]{4}\n\*\* .*\n\*\* File description:\n(\*\* .*\n)+\*\/
