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
require "../coding_style/coding_style"

class OptionManager
  def initialize()
    @options = Hash(String, String).new
  end

  def parse_options() : Hash(String, String)
    OptionParser.parse do |parser|
        parser.banner = "Usage: crnormz [-fgtlh]"
        parser.on("-f", "--ignore-file=", "Ignore file from the checker") { |files|
          @options["ignoring-files"] = files
        }
        parser.on("-g", "--ignore-function=", "Ignore forbidden functions") { |functions|
          @options["ignoring-functions"] = functions
        }
        parser.on("-t", "--ignore-type=", "Ignore errors of a specific type") { |types|
          @options["ignoring-types"] = types
        }
        parser.on("-l", "--ignore-level=", "Ignore errors of a specific level (Major, Minor or Info)") { |levels|
          @options["ignoring-levels"] = levels
        }
        parser.on("-r", "--raw-output", "Enables easy parsing for applications") { |levels|
          @options["raw-output"] = ""
        }
        parser.on("-s", "--sort", "Sort files alphabetically") { |levels|
          @options["sort-file"] = ""
        }
        parser.on("-h", "--help", "Show this help") do
          puts parser
          exit
        end
        parser.invalid_option do |flag|
          STDERR.puts "ERROR: #{flag} is not a valid option."
          STDERR.puts parser
          exit(1)
        end
      end
      return @options
  end
end