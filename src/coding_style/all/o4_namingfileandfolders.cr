require "../coding_style"
require "../../file/file_manager"

class NamingFileAndFolders < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    errors = Set(CodingStyleErrorInfo).new

    if File.basename(file_path).underscore != File.basename(file_path)
      errors.add(CodingStyleErrorInfo.new(self, file_path, -1, -1))
    end
    errors
  end
end
