require "spec_helper"

describe MergeSort do
  let(:sut) { MergeSort.new }

  it "should sort an empty array" do
    sut.sort([]).should == []
  end

  it "should sort an array with one item" do
    sut.sort([2]).should == [2]
  end

  it "should sort an array of numbers" do
    n = 601
    numbers = Array.new(n) { rand(n) }
    sorted_numbers = numbers.sort
    sut.sort(numbers).should == sorted_numbers
  end
end
