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
    n = 600
    numbers = Array.new(n) { rand(n) }
    sorted_numbers = numbers.sort
    Benchmark.bmbm do |x|
      x.report("merge sort") { sut.sort(numbers).should == sorted_numbers }
    end
  end
end