require "spec_helper"

describe QuickSort do
  let(:sut) { QuickSort.new }

  it "should sort an empty array" do
    sut.sort([]).should == []
  end

  it "should sort an array with one item" do
    sut.sort([1]).should == [1]
  end

  it "should sort an array of numbers" do
    n = 600
    numbers = Array.new(n) { rand(n) }
    sut.sort(numbers).should == numbers.sort
  end
end
