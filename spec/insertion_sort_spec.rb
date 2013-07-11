require "spec_helper"

describe InsertionSort do
  it "should sort an empty array" do
    InsertionSort.new.sort([]).should == []
  end

  it "should sort an array with one item" do
    InsertionSort.new.sort([1]).should == [1]
  end
end

