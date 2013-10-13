class Heap
  def initialize(items = [], sorting = QuickSort.new)
    @items = sorting.sort(items.map { |x| Node.new(x, x) })
    @sort_strategy = sorting
  end

  def insert(key, value=key)
    node = Node.new(key, value)
    @items.push(node)
    @items = @sort_strategy.sort(@items)
  end

  def min
    item = @items.shift
    item.value if item
  end

  def max
    item = @items.pop
    item.value if item
  end

  def empty?
    @items.empty?
  end

  def self.heapify(items)
    Heap.new(items)
  end

  alias_method :push, :insert

  class Node
    attr_reader :key, :value

    def initialize(key, value)
      @key = key
      @value = value
    end

    def <=>(other_key)
      other_key <=> @key
    end
  end
end
