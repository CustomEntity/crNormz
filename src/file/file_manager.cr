require "../coding_style/coding_style"

@[Flags]
enum FileType
  Header
  Source
  Makefile
  Directory
  Unknown
end

class FileManager
  def initialize(files : Array(String))
    @files = files

    @files.each {|file_path|

        puts "#{file_path} #{get_file_type(file_path)}"
    }
  end
end

def get_file_type(file_path : String) : FileType
    if file_path =~ /Makefile$/
        FileType::Makefile
      elsif File.extname(file_path) == ".h"
        FileType::Header
      elsif File.extname(file_path) == ".c"
        FileType::Source
      elsif File.directory?(file_path)
        FileType::Directory
      else
        FileType::Unknown
      end
end

def is_right_file_type(file_type : FileType, int file_target) : Bool
  return ((file_target & file_type.value) == file_type.value)
end
