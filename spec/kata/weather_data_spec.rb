require 'spec_helper'
require 'csv'
require 'ostruct'
#In weather.dat you’ll find daily weather data for Morristown, NJ for June 2002. 
#Download this text file, then write a program to output the day number (column one) 
#with the smallest temperature spread (the maximum temperature is the second column, the minimum the third column).

class Day
  include Comparable
  attr_reader :day, :spread

  def initialize(day:, max:, min:)
    @day = day
    @spread = max - min
  end

  def <=>(other)
    @spread <=> other.spread
  end

  def self.map_from(row)
    Day.new(day: row[0], max: row[1].to_f, min: row[2].to_f)
  end
end

class Spread
  include Enumerable

  def initialize(filename, mapper)
    @file_path = File.join(File.dirname(__FILE__), "../fixtures", filename)
    @mapper = mapper
  end

  def each
    open_file do |file|
      file.each_line.with_index do |line, index|
        next if index == 0
        next if line.chomp.empty?
        yield mapper.map_from(line.split)
      end
    end
  end

  private

  def open_file
    file = File.new(file_path)
    yield file
  ensure
    file.close
  end

  attr_reader :file_path, :mapper
end

describe "spread" do
  subject { Spread.new('weather.dat', Day) }

  it 'returns the day with the smallest temperature spread' do
    expect(subject.min.day).to eql('14')
  end
end
