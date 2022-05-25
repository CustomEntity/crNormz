require "../crnormz"
require "./all/o1_deliveryfoldercontents"
require "./coding_style"

DELIVERY_FOLDER_CONTENTS =
  DeliveryFolderContents.new(CodingStyleType::O1, FileType::All.value, CodingStyleLevel::Major, "Contents of the Delivery Folder", "The delivery folder shound not contain compiled (.o, .gch, .a,...), temporary or unnecessary files.")

class CodingStyleManager
  def initialize
    @codingstyles = Set(CodingStyle).new
    @errors = Hash(CodingStyleType, Set(CodingStyleErrorInfo)).new

    self.load_all_codingstyles
  end

  def load_all_codingstyles
    @codingstyles.add(DELIVERY_FOLDER_CONTENTS)
  end

  def apply_check_on(codingstyle : CodingStyle, file_path : String, options : Hash(String, String))
    puts "apply #{codingstyle.@type} on #{file_path}"
  end
end
