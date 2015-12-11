require "spec_helper"

# average case: O(n logn)
# worst case: O(n^2)
# Quick sort is a divide and conquer algorithm.
# Base case: 0,1 elements in the array
# First divide the list into two smaller lists (high list, and low list)
# 1. pick a pivot value.
# 2. move items smaller than pivot into smaller list, and greater into greater list.
# 3. recursively split up lists until the base case
# 4. combine the lesser list with the greater list
describe QuickSort do
  subject { QuickSort.new }

  it "should sort an empty array" do
    expect(subject.sort([])).to eq([])
  end

  it "should sort an array with one item" do
    expect(subject.sort([1])).to eq([1])
  end

  it "should sort an array of numbers" do
    n = 600
    numbers = Array.new(n) { rand(n) }
    sorted_numbers = numbers.sort
    Benchmark.bmbm do |x|
      x.report("quick sort") { expect(subject.sort(numbers)).to eq(sorted_numbers) }
    end
  end
end
