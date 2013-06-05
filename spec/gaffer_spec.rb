require 'spec_helper'

describe Gaffer do
  it 'returns the correct version number' do
    expect(Gaffer.version_string).to eq "Gaffer version #{Gaffer::VERSION}"
  end

  describe Gaffer::Resistor do
    it 'creates a new resistor object' do
      expect(Gaffer::Resistor.new).to be_a Gaffer::Resistor
    end

    describe "colors" do
      it 'has a dictionary of values' do
        expect( Gaffer::Resistor::COLORS ).to be_a Hash

        9.times do |i|
          expect( Gaffer::Resistor::COLORS[i.to_s][:name] ).to be_a String
          expect( Gaffer::Resistor::COLORS[i.to_s][:figure] ).to be_a String
          expect( Gaffer::Resistor::COLORS[i.to_s][:multiplier] ).to be_a String
        end
      end
    end

    describe '::from_colors'
      it 'responds to ::from_colors' do
        expect( Gaffer::Resistor ).to respond_to :from_colors
      end

      it 'needs an array of colors' do
        expect { Gaffer::Resistor::from_colors }.to raise_error(ArgumentError)
        expect { Gaffer::Resistor::from_colors([1, 2, 3, 4]) }.to_not raise_error(ArgumentError)
      end

      it 'only accepts 4 or 5 colors' do
        expect { Gaffer::Resistor::from_colors([1, 2, 3]) }.to raise_error(ArgumentError)
        expect { Gaffer::Resistor::from_colors([1, 2, 3, 4]) }.to_not raise_error(ArgumentError)
        expect { Gaffer::Resistor::from_colors([1, 2, 3, 4, 5]) }.to_not raise_error(ArgumentError)
        expect { Gaffer::Resistor::from_colors([1, 2, 3, 4, 5, 6]) }.to raise_error(ArgumentError)
      end

      describe 'with valid attributes!' do
        it 'returns a number' do
          expect( Gaffer::Resistor::from_colors([1, 2, 3, 4]) ).to be_an Integer
        end

        it 'converts references to Ohms' do
          expect( Gaffer::Resistor::from_colors([2, 2, 1, 1]) ).to eq 220
          expect( Gaffer::Resistor::from_colors([1, 0, 2, 1]) ).to eq 1000
          expect( Gaffer::Resistor::from_colors([1, 0, 3, 1]) ).to eq 10000
        end
      end
  end
end