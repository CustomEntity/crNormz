require "../coding_style"
require "../../file/file_manager"

# Thanks Léo for this regex <3
FUNCTION_REGEX = /^.*?(unsigned|signed)?\s*((s_|sf)\w+|_s|_t|void|int|char|short|long|float|double|bool|size_t)\s+((\w|\*)+)\s*\([^)]*(,\n|\)[^;]\s*)/

class FileCoherence < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors = Set(CodingStyleErrorInfo).new
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
