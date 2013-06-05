require "gaffer/version"

module Gaffer
  def self.version_string
    "Gaffer version #{Gaffer::VERSION}"
  end

  class Resistor
    COLORS = {
      '-2' => {name: 'silver',                multiplier: '0.01'},
      '-1' => {name: 'gold',                  multiplier: '0.1'},
      '0'  => {name: 'black',   figure: '0',  multiplier: '1'},
      '1'  => {name: 'brown',   figure: '1',  multiplier: '10'},
      '2'  => {name: 'red',     figure: '2',  multiplier: '100'},
      '3'  => {name: 'orange',  figure: '3',  multiplier: '1K'},
      '4'  => {name: 'yellow',  figure: '4',  multiplier: '10K'},
      '5'  => {name: 'green',   figure: '5',  multiplier: '100K'},
      '6'  => {name: 'blue',    figure: '6',  multiplier: '1M'},
      '7'  => {name: 'purple',  figure: '7',  multiplier: '10M'},
      '8'  => {name: 'gray',    figure: '8',  multiplier: '100M'},
      '9'  => {name: 'white',   figure: '9',  multiplier: '1000M'}
    }

    def self.from_colors(colors)
      case colors.length
      when 4
        num_1       = colors[0]
        num_2       = colors[1]
        multiplier  = colors[2]
        tolerance   = colors[3]

        (COLORS[num_1.to_s][:figure] + COLORS[num_2.to_s][:figure]).to_i * multiplier(COLORS[multiplier.to_s][:multiplier])
      when 5
        num_1       = colors[0]
        num_2       = colors[1]
        num_3       = colors[2]
        multiplier  = colors[3]
        tolerance   = colors[4]
        (COLORS[num_1.to_s][:figure] + COLORS[num_2.to_s][:figure] + COLORS[num_3.to_s][:figure]).to_i * multiplier(COLORS[multiplier.to_s][:multiplier])
      else
        raise(ArgumentError, 'only 4 or 5 colors please!')
      end
    end

    def self.multiplier(num)
      num.gsub(/K/, '000').gsub(/M/, '000_000').to_i
    end
  end
end
