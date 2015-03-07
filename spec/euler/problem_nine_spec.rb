require "spec_helper"

describe "problem nine" do
  # A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
  # For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  # There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  # Find the product abc.

  # a < b < c
  # c^2 = a^2 + b^2
  class PythagoreanTriplet
    include Enumerable
    attr_reader :max

    def initialize(max = 1_000)
      @max = max
    end

    def each(&block)
      triplets.each(&block)
    end

    private

    def triplets
      Enumerator.new do |yielder|
        (2..max).each do |m|
          (1...m).each do |n|
            # https://en.wikipedia.org/wiki/Pythagorean_triple#Proof_of_Euclid.27s_formula
            a, b, c = m*m - n*n, 2*m*n, m*m + n*n
            yielder.yield([a, b, c])
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
    expect(subject).to include([3, 4, 5])
    expect(subject).to include([5, 12, 13])
  end

  it "returns the triplet for 1000" do
    result = subject.find do |triplet|
      (triplet[0] + triplet[1] + triplet[2]) == 1_000
    end
    expect(result).to eql([375, 200, 425])
  end
end
