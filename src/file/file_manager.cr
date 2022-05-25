

enum FileType
    Unknown
    Header
    Source
    Makefile
    Directory
end


class FileManager

    def initialize(files : Array(String))
        @files = files
        @files.each {|f|
        puts f
    }
    end

end