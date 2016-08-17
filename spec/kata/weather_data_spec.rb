require 'spec_helper'
require 'csv'
require 'ostruct'
#In weather.dat you’ll find daily weather data for Morristown, NJ for June 2002. 
#Download this text file, then write a program to output the day number (column one) 
#with the smallest temperature spread (the maximum temperature is the second column, the minimum the third column).

class Tuple
  include Comparable
  attr_reader :key, :value

  def initialize(key:, max:, min:)
    @key = key
    @value = (max - min).abs
  end

  def <=>(other)
    value <=> other.value
  end
end

class Team
  def self.map_from(row)
    return nil if row[1].nil?
    Tuple.new(key: row[1], max: row[6].to_i, min: row[8].to_i)
  end
end

class Day
  def self.map_from(row)
    Tuple.new(key: row[0], max: row[1].to_f, min: row[2].to_f)
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
        row =  mapper.map_from(line.split)
        next if row.nil?
        yield row
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

describe "weather.dat" do
  subject { Spread.new('weather.dat', Day) }

  it 'returns the day with the smallest temperature spread' do
    expect(subject.min.key).to eql('14')
  end
end

# Part Two: Soccer League Table
# The file football.dat contains the results from the English Premier League for 2001/2. 
# The columns labeled ‘F’ and ‘A’ contain the total number of goals scored for and against each team in that season (so Arsenal scored 79 goals against opponents, and had 36 goals scored against them). Write a program to print the name of the team with the smallest difference in ‘for’ and ‘against’ goals.
#
describe "football.dat" do
  subject { Spread.new('football.dat', Team) }

  it 'returns the day with the smallest temperature spread' do
    expect(subject.min.key).to eql('Aston_Villa')
  end
end
