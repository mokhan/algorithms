require "spec_helper"

describe BubbleSort do
  let(:sut) { BubbleSort.new }

  it "should be able to sort an empty array" do
    sut.sort([]).should == []
  end

  it "should be able to sort an array with one item" do
    sut.sort([1]).should == [1]
  end

  it "should be able to sort an array of numbers" do
    n = 500
    numbers = Array.new(n) { rand(n) }
    Benchmark.bmbm do |x|
      x.report("bubble sort") { sut.sort(numbers).should == numbers.sort }
    end
  end
end
