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

CONDITION_REGEX    = /^[^\w]*(\s*if *\()|(\s*while *\()|(\s*for *\()|(\s*switch *\()|(\s*else *)|(\s*do *\()/
ELSE_IF_COND_REGEX = /^[^\w]*\s*else if *\(/

class ConditionalBranching < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, content : String, options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors : Set(CodingStyleErrorInfo) = Set(CodingStyleErrorInfo).new
    splitted_content = content.split("\n")
    curr_line : Int32 = 1
    depth : Int32 = 0
    is_no_bracket_cond : Bool = false
    is_in_elsif : Bool = false
    depth_when_first_elsif : Int32 = -1
    depth_prev_elsif : Int32 = -1
    is_no_bracket_cond_elsif : Bool = false
    is_prev_line_no_bracket_elsif : Bool = false
    just_now : Bool = false

    splitted_content.each { |line|
      if is_no_bracket_cond
        is_no_bracket_cond = false
        if is_no_bracket_cond_elsif
          is_prev_line_no_bracket_elsif = true
          just_now = true
          is_no_bracket_cond_elsif = false
        else
          if splitted_content[curr_line] !~ ELSE_IF_COND_REGEX
            depth -= 1
          end
        end
      end
      if line !~ ELSE_IF_COND_REGEX
        depth -= line.count("}")
        if line.count("}") != 0
        end
      end
      if is_prev_line_no_bracket_elsif && line !~ ELSE_IF_COND_REGEX
        if just_now == false
          depth = depth_when_first_elsif - 1
          is_prev_line_no_bracket_elsif = false
        else
          just_now = false
        end
      end
      if is_in_elsif && depth == depth_prev_elsif
        is_in_elsif = false
        depth = depth_when_first_elsif - 1
        depth_when_first_elsif = -1
        depth_prev_elsif = -1
      end
      if line =~ CONDITION_REGEX
        if line =~ ELSE_IF_COND_REGEX
          if depth_when_first_elsif == -1
            depth_when_first_elsif = depth
          end
          depth_prev_elsif = depth
          is_in_elsif = true
        end
        if line.count("{") == 0
          if line =~ ELSE_IF_COND_REGEX
            is_no_bracket_cond_elsif = true
          end
          is_no_bracket_cond = true
        end
        depth += 1
        if depth >= 4
          errors.add(CodingStyleErrorInfo.new(self, file_path, curr_line, -1))
        end
       else
        if line.count("{") != 0
          depth += 1
        end
      end
      curr_line += 1
    }
    errors
  end
end
