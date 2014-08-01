require "spec_helper"

describe "Algorithm efficiency" do
  let(:bubble_sort) { BubbleSort.new }
  let(:insertion_sort) { InsertionSort.new }
  let(:merge_sort) { MergeSort.new }
  let(:quick_sort) { QuickSort.new }

  it "should sort an array of 100 numbers" do
    run(100)
  end

  it "should sort an array of 500 numbers" do
    run(500)
  end

  it "should sort an array of 1000 numbers" do
    run(1000)
  end

  it "should sort an array of 5000 numbers" do
    run(5000)
  end

  def run(n)
    numbers = Array.new(n) { rand(n) }
    Benchmark.bmbm do |x|
      x.report("#{n}-bubble") { bubble_sort.sort(numbers) }
      x.report("#{n}-insertion") { insertion_sort.sort(numbers) }
      x.report("#{n}-merge") { merge_sort.sort(numbers) }
      x.report("#{n}-quick") { quick_sort.sort(numbers) }
      x.report("#{n}-ruby") { numbers.sort }
    end
  end
end
