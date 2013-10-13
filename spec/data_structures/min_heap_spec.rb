require "spec_helper"

describe MinHeap do
  it "should return nil" do
    heap = MinHeap.new
    heap.min.should be_nil
  end

  it "should return the items order from lowest to highest" do
    n = 100
    numbers = Array.new(n) { rand(n) }
    heap = MinHeap.new(numbers.dup)

    results = []
    results << heap.min until heap.empty?
    results.should == numbers.sort
  end
end
