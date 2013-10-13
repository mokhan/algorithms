class MinHeap
  def initialize(items = [])
    @items = items
    @items.sort!
  end

  def min
    @items.shift
  end

  def empty?
    @items.empty?
  end
end
