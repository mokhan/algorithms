require "spec_helper"

describe Heap do
  context :min do
    context "emtpy" do
      it "returns nil" do
        heap = Heap.new
        expect(heap.min).to be_nil
        expect(heap).to be_empty
      end
    end

    context "full" do
      it "returns the items order from lowest to highest" do
        n = 10
        numbers = Array.new(n) { rand(n) }
        heap = Heap.heapify(numbers.dup)

        results = []
        results << heap.min until heap.empty?
        expect(results).to eql(numbers.sort)
      end
    end
  end

  context :max do
    it "returns nil when empty" do
      heap = Heap.new
      expect(heap.max).to be_nil
      expect(heap).to be_empty
    end

    it "returns the items in order from highest to lowest" do
      n = 10
      numbers = Array.new(n) { rand(n) }
      heap = Heap.heapify(numbers.dup)
      results = []
      results.push(heap.max) until heap.empty?
      expect(results).to eql(numbers.sort.reverse)
    end
  end
end
