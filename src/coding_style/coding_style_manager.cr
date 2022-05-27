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
require "../crnormz"
require "./all/o1_deliveryfoldercontents"
require "./all/o3_filecoherence"
require "./all/o4_namingfileandfolders"
require "./all/g1_fileheader"
require "./all/g2_functions_separation"
require "./all/g6_include"
require "./all/g7_line_endings"
require "./all/f3_columns_number"
require "./all/a3_line_break"
require "./all/h2_include_guard"
require "./all/h3_macros"
require "./coding_style"

DELIVERY_FOLDER_CONTENTS =
  DeliveryFolderContents.new(CodingStyleType::O1, FileType::All.value, CodingStyleLevel::Major, "Contents of the Delivery Folder", "The delivery folder shound not contain compiled (.o, .gch, .a,...), temporary or unnecessary files.")
FILE_COHERENCE =
  FileCoherence.new(CodingStyleType::O3, FileType::Source.value, CodingStyleLevel::Major, "File Coherence", "A source file should not contain more than 5 functions.")
NAMING_FILE_AND_FOLDERS =
  NamingFileAndFolders.new(CodingStyleType::O4, FileType::Source.value | FileType::Directory.value | FileType::Header.value, CodingStyleLevel::Major, "Naming Files and Folders", "All file names and folders should be in English, according to the snake_case convention.")
FILE_HEADER =
  FileHeader.new(CodingStyleType::G1, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Major, "File Header", "The source files (.c,.h, Makefile,...) should always start with the standard header of the school.")
FUNCTION_SEPARATION =
  FunctionSeparation.new(CodingStyleType::G2, FileType::Source.value, CodingStyleLevel::Minor, "Separation of functions", "Inside a source file, one and only one empty line should separate the implementations of functions.")
INCLUDE =
  Include.new(CodingStyleType::G6, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Major, "Include", "Include directive should only include header .h files.")
LINE_ENDINGS =
  LineEndings.new(CodingStyleType::G7, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Minor, "Line Endings", "Line endings must be done in UNIX style (with \\n).")

COLUMNS_NUMBER =
  LineEndings.new(CodingStyleType::F3, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Major, "Number of columns", "The length of a line should not exceed 80 columns (not to be confused with 80 characters!).")
LINE_BREAK =
  LineBreak.new(CodingStyleType::A3, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Info, "Line break at the end of file", "Files should end with a line break.")

INCLUDE_GUARD =
  IncludeGuard.new(CodingStyleType::H2, FileType::Header.value, CodingStyleLevel::Minor, "Include Guard", "Headers should be protected from double inclusion.")
MACROS =
  Macros.new(CodingStyleType::H3, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Minor, "Macros", "Macros should match only one statement.")

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
    @codingstyles[FILE_HEADER.@type] = FILE_HEADER
    @codingstyles[FUNCTION_SEPARATION.@type] = FUNCTION_SEPARATION
    @codingstyles[INCLUDE.@type] = INCLUDE
    @codingstyles[LINE_ENDINGS.@type] = LINE_ENDINGS

    @codingstyles[COLUMNS_NUMBER.@type] = COLUMNS_NUMBER
    @codingstyles[LINE_BREAK.@type] = LINE_BREAK
    @codingstyles[INCLUDE_GUARD.@type] = INCLUDE_GUARD
    @codingstyles[MACROS.@type] = MACROS
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
    new_errors.each { |err|
      curr_errors.add(err)
    }
    @errors[codingstyle.@type] = curr_errors
    file.close
  end
end
