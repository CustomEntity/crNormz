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