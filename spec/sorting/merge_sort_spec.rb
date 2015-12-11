require "spec_helper"

describe MergeSort do
  subject { MergeSort.new }

  it "should sort an empty array" do
    expect(subject.sort([])).to eq([])
  end

  it "should sort an array with one item" do
    expect(subject.sort([2])).to eq([2])
  end

  it "should sort an array of numbers" do
    n = 601
    numbers = Array.new(n) { rand(n) }
    sorted_numbers = numbers.sort
    expect(subject.sort(numbers)).to eq(sorted_numbers)
  end
end
