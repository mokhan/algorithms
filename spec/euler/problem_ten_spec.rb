require 'spec_helper'
require 'prime'

describe "problem ten" do
  #The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  #Find the sum of all the primes below two million.

  class SumOfPrime
    attr_reader :limit

    def initialize(limit)
      @limit = limit
    end

    def sum
      each.reduce(:+)
    end

    def each
      Prime.each(limit)
      #Enumerator.new do |yielder|
        #2.upto(limit) do |n|
          #yielder.yield(n) if prime?(n)
        #end
      #end
    end

    private

    def prime?(number)
      (2...number).each do |n|
        return false if number % n == 0
      end
      true
    end
  end

  it 'returns the sum of the primes below 10' do
    expect(SumOfPrime.new(10).sum).to eql(17)
  end

  it 'returns thesum of the primes below 2_000_000' do
    expect(SumOfPrime.new(2_000_000).sum).to eql(142_913_828_922)
  end
end
