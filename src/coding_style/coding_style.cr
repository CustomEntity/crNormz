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

SNAKE_CASE_REGEX = /^[a-z]+(?:_[a-z0-9]+)*$/m

enum CodingStyleType
  O1
  O2
  O3
  O4
  G1
  G2
  G3
  G4
  G5
  G6
  G7
  G8
  G9
  G10
  F1
  F2
  F3
  F4
  F5
  F6
  F7
  L1
  L2
  L3
  L4
  L5
  L6
  V1
  V2
  V3
  C1
  C2
  C3
  A1
  A2
  A3
  H1
  H2
  H3
end

enum CodingStyleLevel
  Major
  Minor
  Info
end

class CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    @errors = Set(CodingStyleErrorInfo).new
  end

  def handle(file_path : String, content : String, lines : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    puts "Handle method not implemented !"
    exit(84)
  end

  def handle_line(file_path : String, line : String, options : Hash(String, Strig)) : Set(CodingStyleErrorInfo)
  end

  def get_row_column(lines : Array(String), byte : Int32)
    byte_remain = byte
    line_count = 1

    lines.each { |line|
      line = line.ends_with?("\n") ? line : line + "\n"
      if byte_remain - line.size < 0
        return line_count, byte_remain + 1
      end
      byte_remain -= line.size
      line_count += 1
    }
    return -1, -1
  end
end

class CodingStyleErrorInfo
  def initialize(@codingstyle : CodingStyle, @file_path : String, @row : Int32, @column : Int32, @additional_info : String = "")
  end
end
