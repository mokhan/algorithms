require "spec_helper"

describe "problem six" do
  #Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

  class NaturalNumbers
    include Enumerable
    attr_reader :limit

    def initialize(limit)
      @limit = limit
    end

    def each
      0.upto(limit) do |n|
        yield n
      end
    end

    def sum_of_squares
      sum { |n| n*n }
    end

    def square_of_the_sum
      result = sum
      result * result
    end

    def difference
      square_of_the_sum - sum_of_squares
    end

    private

    def sum
      inject(0) do |memo, n|
        memo += block_given? ? yield(n) : n
      end
    end
  end

  it "returns the sum of first 10 natural numbers" do
    subject = NaturalNumbers.new(10)
    expect(subject.sum_of_squares()).to eql(385)
  end

  it "returns the square of the sum of the first 10 natural numbers" do
    subject = NaturalNumbers.new(10)
    expect(subject.square_of_the_sum()).to eql(3025)
  end

  it "returns the different between the sum of the squares and the square of the sum" do
    subject = NaturalNumbers.new(10)
    expect(subject.difference).to eql(2640)
  end

  it "solves the problem" do
    subject = NaturalNumbers.new(100)
    expect(subject.difference).to eql(25164150)
  end
end
