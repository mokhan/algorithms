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
    n = 6
    numbers = Array.new(n) { rand(n) }
    sut.sort(numbers).should == numbers.sort
  end
end
