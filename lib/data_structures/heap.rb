class Heap
  def initialize(items = [], sorting = QuickSort.new)
    @items = sorting.sort(items)
    @sort_strategy = sorting
  end

  def insert(item)
    @items.push(item)
    @items = @sort_strategy.sort(@items)
  end

  def min
    @items.shift
  end

  def max
    @items.pop
  end

  def empty?
    @items.empty?
  end

  def self.heapify(items)
    Heap.new(items)
  end

  alias_method :push, :insert
end
