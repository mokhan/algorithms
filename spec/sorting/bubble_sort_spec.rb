require "spec_helper"

describe BubbleSort do
  subject { BubbleSort.new }

  it "should be able to sort an empty array" do
    expect(subject.sort([])).to eq([])
  end

  it "should be able to sort an array with one item" do
    expect(subject.sort([1])).to eq([1])
  end

  it "should be able to sort an array of numbers" do
    n = 500
    numbers = Array.new(n) { rand(n) }
    Benchmark.bmbm do |x|
      x.report("bubble sort") { expect(subject.sort(numbers)).to eq(numbers.sort) }
    end
  end
end
