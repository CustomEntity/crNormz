#MIT License
#
#Copyright (c) 2022 CustomEntity
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
class String

    def add_style(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end

    def black
      add_style(30)
    end

    def orange
      add_style(93)
    end

    def red
      add_style(31)
    end

    def light_red
      add_style(91)
    end

    def green
      add_style(32)
    end

    def light_green
      add_style(92)
    end

    def dark_grey
      add_style(90)
    end

    def yellow
      add_style(33)
    end

    def blue
      add_style(34)
    end

    def light_blue
      add_style(94)
    end

    def magenta
      add_style(35)
    end

    def cyan
      add_style(36)
    end

    def grey
      add_style(37)
    end

    def bold
      add_style(1)
    end

    def italic
      add_style(3)
    end

    def underline
      add_style(4)
    end
  end