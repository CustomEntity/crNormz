require "../crnormz"
require "./all/o1_deliveryfoldercontents"
require "./coding_style"

DELIVERY_FOLDER_CONTENTS =
  DeliveryFolderContents.new(CodingStyleType::O1, FileType::All.value, CodingStyleLevel::Major, "Contents of the Delivery Folder", "The delivery folder shound not contain compiled (.o, .gch, .a,...), temporary or unnecessary files.")

class CodingStyleManager
  def initialize
    @codingstyles = Hash(CodingStyleType, CodingStyle).new
    @errors = Hash(CodingStyleType, Set(CodingStyleErrorInfo)).new

    self.load_all_codingstyles
  end

  def load_all_codingstyles
    @codingstyles[DELIVERY_FOLDER_CONTENTS.@type] = DELIVERY_FOLDER_CONTENTS
  end

  def apply_check_on(codingstyle : CodingStyle, file_path : String, options : Hash(String, String))
    file = File.open(file_path)


    curr_errors : Set(CodingStyleErrorInfo)
    if (@errors.has_key?(codingstyle.@type))
      curr_errors = @errors[codingstyle.@type]
    else
      curr_errors = Set(CodingStyleErrorInfo).new
    end
    
    new_errors : Set(CodingStyleErrorInfo) = codingstyle.handle(file_path, options)
    new_errors.each {|err|
      curr_errors.add(err)
    }
    @errors[codingstyle.@type] = curr_errors
    file.close
  end
end
