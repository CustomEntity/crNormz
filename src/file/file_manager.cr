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
require "../coding_style/coding_style"

COMMENT_REGEX = /(\'.*?\'|\".*?\")|(\/\*.*?\*\/|\/\/[^\r\n]*$)/m

@[Flags]
enum FileType
  Header
  Source
  Makefile
  Directory
  Unknown
end

class Comment
  def initialize(byte_begin : Int32, byte_end : Int32)
    @byte_begin = byte_begin
    @byte_end = byte_end
  end
end

class FileManager
  def initialize(files : Array(String))
    @files = files
  end

  def set_files(files : Array(String))
    @files = files
  end
end

def retrieve_comments(content : String) : Set(Comment)
  comments : Set(Comment) = Set(Comment).new

  content.scan(COMMENT_REGEX).each {|match|
    comments.add(Comment.new(match.begin, match.end))
  }
  comments
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
