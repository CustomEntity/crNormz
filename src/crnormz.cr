require "./utils/string_utils"
require "./file/file_manager"
require "./coding_style/coding_style_manager"
require "option_parser"

codingstyle_manager = CodingStyleManager.new
file_manager = FileManager.new(Dir.glob("**/*"))
options = Hash(String, String).new

OptionParser.parse do |parser|
  parser.banner = "Usage: crystal crnormz [-fgtlh]"
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


file_manager.@files.each {|file_path|
  codingstyle_manager.@codingstyles.each {|codingstyle|
    if (is_right_file_type(get_file_type(file_path), codingstyle.@file_target)) # TODO: Add check for options
      codingstyle_manager.apply_check_on(codingstyle, file_path, options)
    end
  }
}


puts "
              __                         
  ___ _ __ /\\ \\ \\___  _ __ _ __ ___  ____
 / __| '__/  \\/ / _ \\| '__| '_ ` _ \\|_  /
| (__| | / /\\  / (_) | |  | | | | | |/ / 
 \\___|_| \\_\\ \\/ \\___/|_|  |_| |_| |_/___|
                                         
".red.bold

