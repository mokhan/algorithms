require "spec_helper"

describe MergeSort do
  let(:sut) { MergeSort.new }

  it "should sort an empty array" do
    expect(sut.sort([])).to eq([])
  end

  it "should sort an array with one item" do
    expect(sut.sort([2])).to eq([2])
  end

  it "should sort an array of numbers" do
    n = 601
    numbers = Array.new(n) { rand(n) }
    sorted_numbers = numbers.sort
    expect(sut.sort(numbers)).to eq(sorted_numbers)
  end
end
