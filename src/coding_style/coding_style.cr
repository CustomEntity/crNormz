enum CodingStyleType
  O1
  O2
  O3
  O4
  G1
  G2
  G3
  G4
  G5
  G6
  G7
  G8
  G9
  G10
  F1
  F2
  F3
  F4
  F5
  F6
  F7
  L1
  L2
  L3
  L4
  L5
  L6
  V1
  V2
  V3
  C1
  C2
  C3
  A1
  A2
  A3
  H1
  H2
  H3
end

enum CodingStyleLevel
  Major
  Minor
  Info
end

class CodingStyle
  def initialize(@type : CodingStyleType, @file_target : Int32, @level : CodingStyleLevel, @name : String, @desc : String)
    @errors = Set(CodingStyleErrorInfo).new
  end

  def handle(file_path : String, file_content : Array(String), options : Hash(String, String)) : Set(CodingStyleErrorInfo)
    puts "Handle method not implemented !"
    exit(84)
  end
end

class CodingStyleErrorInfo
  def initialize(@file_path : String, @row : Int32, @column : Int32)
  end
end
