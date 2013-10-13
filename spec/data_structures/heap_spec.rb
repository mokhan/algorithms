require "spec_helper"

describe Heap do
  context :min do
    context "emtpy" do
      it "should return nil" do
        heap = Heap.new
        heap.min.should be_nil
        heap.empty?.should be_true
      end
    end

    context "full" do
      it "should return the items order from lowest to highest" do
        n = 10
        numbers = Array.new(n) { rand(n) }
        heap = Heap.heapify(numbers.dup)

        results = []
        results << heap.min until heap.empty?
        results.should == numbers.sort
      end
    end
  end

  context :max do
    it "should return nil when empty" do
      heap = Heap.new
      heap.max.should be_nil
      heap.empty?.should be_true
    end

    it "should return the items in order from highest to lowest" do
      n = 10
      numbers = Array.new(n) { rand(n) }
      heap = Heap.heapify(numbers.dup)
      results = []
      results.push(heap.max) until heap.empty?
      results.should == numbers.sort.reverse
    end
  end
end
