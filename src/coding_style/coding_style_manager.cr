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
require "./all/g3_indent_prep_dir"
require "./all/g6_include"
require "./all/g7_line_endings"
require "./all/g8_trailing_spaces"
require "./all/g9_trailing_lines"
require "./all/f2_naming_functions"
require "./all/f3_columns_number"
require "./all/f4_lines_number"
require "./all/f5_arguments"
require "./all/f6_comment_in_func"
require "./all/l1_code_line_content"
require "./all/l2_indent"
require "./all/l4_curly_brackets"
require "./all/v1_naming_identifiers"
require "./all/v3_pointers"
require "./all/c1_conditional_branching"
require "./all/c3_goto"
require "./all/a3_line_break"
require "./all/h2_include_guard"
require "./all/h3_macros"
require "./coding_style"
require "../file/file_manager"

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
INDENT_PREP_DIR =
  IndentPrepDir.new(CodingStyleType::G3, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Minor, "Indentation of preprocessor directives", "The preprocessor directives should be indented according to the level of indirection.")
INCLUDE =
  Include.new(CodingStyleType::G6, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Major, "Include", "Include directive should only include header .h files.")
LINE_ENDINGS =
  LineEndings.new(CodingStyleType::G7, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Minor, "Line Endings", "Line endings must be done in UNIX style (with \\n).")
TRAILING_SPACES =
  TrailingSpaces.new(CodingStyleType::G8, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Minor, "Trailing Spaces", "No trailing spaces must be present at the end of a line.")
TRAILING_LINES =
  TrailingLines.new(CodingStyleType::G9, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Minor, "Trailing Lines", "No more than 1 trailing empty line must be present.")
NAMING_FUNCTIONS =
  NamingFunctions.new(CodingStyleType::F2, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Major, "Naming functions", "All function names should be in English, according to the snake_case convention (meaning that it is composed only of lowercase, numbers, and underscores)..")
COLUMNS_NUMBER =
  ColumnsNumber.new(CodingStyleType::F3, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Major, "Number of columns", "The length of a line should not exceed 80 columns (not to be confused with 80 characters!).")
LINES_NUMBER =
  LinesNumber.new(CodingStyleType::F4, FileType::Source.value, CodingStyleLevel::Major, "Number of Lines", "The body of a function should not exceeds 20 lines.")
ARGUMENTS =
  Arguments.new(CodingStyleType::F5, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Major, "Arguments", "The statement of arguments should be in accordance to the ISO/ANSI C syntax.")
COMMENT_IN_FUNC =
  CommentInFunc.new(CodingStyleType::F6, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Minor, "Comments inside a function", "There should be no comment within a function.")
CODE_LINE_CONTENT =
  CodeLineContent.new(CodingStyleType::L1, FileType::Source.value, CodingStyleLevel::Major, "Code line content", "A line should correspond to only one statement.")
INDENT =
  Indent.new(CodingStyleType::L2, FileType::Source.value | FileType::Header.value | FileType::Makefile.value, CodingStyleLevel::Minor, "Indentation", "Each indentation level must be done by using 4 spaces. When entering a new scope the indentation level must be incremented.")
CURLY_BRACKETS =
  CurlyBrackets.new(CodingStyleType::L4, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Minor, "Curly brackets", "Opening curly brackets should be at the end of their line, except for functions where they must be placed alone on their line.")
NAMING_IDENTIFIERS =
  NamingIdentifiers.new(CodingStyleType::V1, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Major, "Naming Identifiers", "All identifier names should be in English, according to the snake_case convention.")
POINTERS =
  Pointers.new(CodingStyleType::V3, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Minor, "Pointers", "The pointer symbol (*) should be attached to the associated variable, with no spaces.")
CONDITIONAL_BRANCHING =
  ConditionalBranching.new(CodingStyleType::C1, FileType::Source.value, CodingStyleLevel::Minor, "Conditional Branching", "A conditionnal block (while, for, if, else, ...) should not contain more than 3 branchings.")
GOTO =
  Goto.new(CodingStyleType::C3, FileType::Source.value | FileType::Header.value, CodingStyleLevel::Minor, "Goto", "Est-ce que ta déjà léché les deux boules d'un goto ?")
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
    @codingstyles[INDENT_PREP_DIR.@type] = INDENT_PREP_DIR
    @codingstyles[INCLUDE.@type] = INCLUDE
    @codingstyles[LINE_ENDINGS.@type] = LINE_ENDINGS
    @codingstyles[TRAILING_SPACES.@type] = TRAILING_SPACES
    @codingstyles[TRAILING_LINES.@type] = TRAILING_LINES
    @codingstyles[NAMING_FUNCTIONS.@type] = NAMING_FUNCTIONS
    @codingstyles[COLUMNS_NUMBER.@type] = COLUMNS_NUMBER
    @codingstyles[LINES_NUMBER.@type] = LINES_NUMBER
    @codingstyles[ARGUMENTS.@type] = ARGUMENTS
    @codingstyles[COMMENT_IN_FUNC.@type] = COMMENT_IN_FUNC
    @codingstyles[CODE_LINE_CONTENT.@type] = CODE_LINE_CONTENT
    @codingstyles[INDENT.@type] = INDENT
    @codingstyles[CURLY_BRACKETS.@type] = CURLY_BRACKETS
    @codingstyles[NAMING_IDENTIFIERS.@type] = NAMING_IDENTIFIERS
    @codingstyles[POINTERS.@type] = POINTERS
    @codingstyles[CONDITIONAL_BRANCHING.@type] = CONDITIONAL_BRANCHING
    @codingstyles[GOTO.@type] = GOTO
    @codingstyles[LINE_BREAK.@type] = LINE_BREAK
    @codingstyles[INCLUDE_GUARD.@type] = INCLUDE_GUARD
    @codingstyles[MACROS.@type] = MACROS
  end

  def apply_check_on(codingstyle : CodingStyle, file_path : String, content : String, options : Hash(String, String))
    curr_errors : Set(CodingStyleErrorInfo)
    if (@errors.has_key?(codingstyle.@type))
      curr_errors = @errors[codingstyle.@type]
    else
      curr_errors = Set(CodingStyleErrorInfo).new
    end
    new_errors : Set(CodingStyleErrorInfo) = codingstyle.handle(file_path, content, options)
    new_errors.each { |err|
      curr_errors.add(err)
    }
    @errors[codingstyle.@type] = curr_errors
  end
end
