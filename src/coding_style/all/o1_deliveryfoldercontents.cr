require "../coding_style"

class DeliveryFolderContents < CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    super(@type, @file_target, @level, @name, @desc)
  end

  def handle(file_path : String, file_content : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    puts "Delivery folder contents"
  end
end
