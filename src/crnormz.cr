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
require "./utils/string_utils"
require "./file/file_manager"
require "./coding_style/coding_style_manager"
require "option_parser"
require "benchmark"

codingstyle_manager = CodingStyleManager.new
file_manager = FileManager.new(Dir.glob("**/*"))
options = Hash(String, String).new

OptionParser.parse do |parser|
  parser.banner = "Usage: crnormz [-fgtlh]"
  parser.on("-f", "--ignore-file=", "Ignore file from the checker") { |files|
    options["ignoring-files"] = files
  }
  parser.on("-g", "--ignore-function=", "Ignore forbidden functions") { |functions|
    options["ignoring-functions"] = functions
  }
  parser.on("-t", "--ignore-type=", "Ignore errors of a specific type") { |types|
    options["ignoring-types"] = types
  }
  parser.on("-l", "--ignore-level=", "Ignore errors of a specific level (Major, Minor or Info)") { |levels|
    options["ignoring-levels"] = levels
  }
  parser.on("-r", "--raw-output", "Enables easy parsing for applications") { |levels|
    options["raw-output"] = ""
  }
  parser.on("-s", "--sort", "Sort files alphabetically") { |levels|
    options["sort-file"] = ""
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

if options.has_key?("sort-file")
  sorted : Array(String) = file_manager.@files.sort
  file_manager.set_files(sorted)
end

file_manager.@files.each { |file_path|
  content = ""
  if options.has_key?("ignoring-files") && Regex.new(options["ignoring-files"]).match(file_path)
    next
  end
  if get_file_type(file_path) != FileType::Directory
    content = File.read(file_path)
  end
  codingstyle_manager.@codingstyles.each_value { |codingstyle|
    if is_right_file_type(get_file_type(file_path), codingstyle.@file_target) && !(options.has_key?("ignoring-types") && options["ignoring-types"].split(",").count { |s| s == codingstyle.@type.to_s } != 0) && !(options.has_key?("ignoring-levels") && options["ignoring-levels"].split(",").count { |s| s.downcase == codingstyle.@level.to_s.downcase } != 0)
      codingstyle_manager.apply_check_on(codingstyle, file_path, content, options)
    end
  }
}

if !options.has_key?("raw-output")
  puts "
              __
  ___ _ __ /\\ \\ \\___  _ __ _ __ ___  ____
 / __| '__/  \\/ / _ \\| '__| '_ ` _ \\|_  /
| (__| | / /\\  / (_) | |  | | | | | |/ /
 \\___|_| \\_\\ \\/ \\___/|_|  |_| |_| |_/___|

".red.bold
end

has_value : Bool = false
codingstyle_manager.@errors.each { |key, value|
  codingstyle_manager.@errors[key].each { |error|
    has_value = true
  }
}

major = 0
minor = 0
info = 0

if options.has_key?("raw-output") && has_value
  codingstyle_manager.@errors.each { |key, value|
    if value.size != 0
      codingstyle_manager.@errors[key].each { |error|
        puts "#{error.@codingstyle.@type};#{error.@file_path};#{error.@row};#{error.@column}" # {error.@additional_info}"

        if error.@codingstyle.@level == CodingStyleLevel::Major
          major += 1
        elsif error.@codingstyle.@level == CodingStyleLevel::Minor
          minor += 1
        elsif error.@codingstyle.@level == CodingStyleLevel::Info
          info += 1
        end
      }
    end
  }
  puts "#{major};#{minor};#{info}"
else
  unless has_value
    puts " #{"➥"} #{" No coding style error ! Good job my boy".light_green}"
  else
    print "#{"Major".light_red} • #{"Minor".light_green} • #{"Info".light_blue}"
    puts

    codingstyle_manager.@errors.each { |key, value|
      if value.size != 0
        puts
        if codingstyle_manager.@codingstyles[key].@level == CodingStyleLevel::Major
          puts " ‣ #{"(#{key})".light_red} - #{codingstyle_manager.@codingstyles[key].@desc}"
        elsif codingstyle_manager.@codingstyles[key].@level == CodingStyleLevel::Minor
          puts " ‣ #{"(#{key})".light_green} - #{codingstyle_manager.@codingstyles[key].@desc}"
        elsif codingstyle_manager.@codingstyles[key].@level == CodingStyleLevel::Info
          puts " ‣ #{"(#{key})".light_blue} - #{codingstyle_manager.@codingstyles[key].@desc}"
        end
        puts
        codingstyle_manager.@errors[key].each { |error|
          puts "      • #{error.@file_path.dark_grey}#{error.@row != -1 ? ":#{error.@row}".dark_grey : ""}#{error.@column != -1 ? ":#{error.@column}".dark_grey : ""}#{error.@additional_info}"

          if error.@codingstyle.@level == CodingStyleLevel::Major
            major += 1
          elsif error.@codingstyle.@level == CodingStyleLevel::Minor
            minor += 1
          elsif error.@codingstyle.@level == CodingStyleLevel::Info
            info += 1
          end
        }
      end
    }

    puts
    puts " #{"MAJOR".light_red}: #{major} • #{"MINOR".light_green}: #{minor} • #{"INFO".light_blue}: #{info}"
  end
end
