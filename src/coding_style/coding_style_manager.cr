require "../crnormz"
require "./all/o1_deliveryfoldercontents"
require "./all/o3_filecoherence"
require "./all/o4_namingfileandfolders"
require "./coding_style"

DELIVERY_FOLDER_CONTENTS =
  DeliveryFolderContents.new(CodingStyleType::O1, FileType::All.value, CodingStyleLevel::Major, "Contents of the Delivery Folder", "The delivery folder shound not contain compiled (.o, .gch, .a,...), temporary or unnecessary files.")
FILE_COHERENCE =
  FileCoherence.new(CodingStyleType::O3, FileType::Source.value, CodingStyleLevel::Major, "File Coherence", "A source file should not contain more than 5 functions.")
NAMING_FILE_AND_FOLDERS = 
  NamingFileAndFolders.new(CodingStyleType::O4, FileType::Source.value | FileType::Directory.value | FileType::Header.value, CodingStyleLevel::Major, "Naming Files and Folders", "All file names and folders should be in English, according to the snake_case convention.")

class CodingStyleManager
  def initialize
    @codingstyles = Hash(CodingStyleType, CodingStyle).new
    @errors = Hash(CodingStyleType, Set(CodingStyleErrorInfo)).new

    self.load_all_codingstyles
  end

  def load_all_codingstyles
    @codingstyles[DELIVERY_FOLDER_CONTENTS.@type] = DELIVERY_FOLDER_CONTENTS
    @codingstyles[FILE_COHERENCE.@type] = FILE_COHERENCE
    @codingstyles[NAMING_FILE_AND_FOLDERS.@type] = NAMING_FILE_AND_FOLDERS
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
