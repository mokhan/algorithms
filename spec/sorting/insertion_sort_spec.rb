require "spec_helper"

describe InsertionSort do
  let(:sut) { InsertionSort.new }

  it "should sort an empty array" do
    sut.sort([]).should == []
  end

  it "should sort an array with one item" do
    sut.sort([1]).should == [1]
  end

  it "should sort an array of numbers" do
    n = 200
    numbers = Array.new(n) { rand(n) }
    Benchmark.bmbm do |x|
      x.report("insertion sort") { sut.sort(numbers).should == numbers.sort }
    end
  end
end

