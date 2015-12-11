require "spec_helper"

describe InsertionSort do
  subject { InsertionSort.new }

  it "should sort an empty array" do
    expect(subject.sort([])).to eq([])
  end

  it "should sort an array with one item" do
    expect(subject.sort([1])).to eq([1])
  end

  it "should sort an array of numbers" do
    n = 200
    numbers = Array.new(n) { rand(n) }
    Benchmark.bmbm do |x|
      x.report("insertion sort") { expect(subject.sort(numbers)).to eq(numbers.sort) }
    end
  end
end

