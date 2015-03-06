require "spec_helper"

describe "problem nine" do
  # A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
  # For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  # There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  # Find the product abc.
  #
  class PythagoreanTriplet
    include Enumerable

    def initialize(max = 100_000)
      @max = max
    end

    def each(&block)
      triplets.each(&block)
    end

    private

    def triplets
      Enumerator.new do |yielder|
        0.upto(@max) do |n|
          x = n * n
          y = (n+1) * (n+1)
          z = (n+2) * (n+2)
          if x + y == z
            puts "#{n}: MATCH"
            yielder.yield([n, n+1, n+2]) 
          else
            puts "#{n}: no match"
          end
        end
      end
    end
  end

  subject { PythagoreanTriplet.new }

  it "returns the triplet for 25" do
    expect(subject.first).to eql([3, 4, 5])

    result = subject.find do |triplet|
      (triplet.last * triplet.last) == 25
    end
    expect(result).to eql([3, 4, 5])
  end

  it "returns the triplet for 1000" do
    result = subject.find do |triplet|
      (triplet.last * triplet.last) == 1_000
    end
    expect(result).to eql(10)
  end
end
