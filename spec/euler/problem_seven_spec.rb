require "spec_helper"
require 'prime'

describe "problem seven" do
  #By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  #What is the 10 001st prime number?

  class Primes
    include Enumerable

    def [](index)
      each_with_index do |n, current|
        return n if current == (index - 1)
      end
    end

    def each(&block)
      prime.each(&block)
    end

    private

    def prime
      Prime
    end
  end

  subject { Primes.new }

  it "returns the first 6 primes" do
    expect(subject.take(6)).to eql([2, 3, 5, 7, 11, 13])
  end

  it "returns 13" do
    expect(subject[6]).to eql(13)
  end

  it "returns the 10_001 prime" do
    expect(subject[10_001]).to eql(104743)
  end
end
