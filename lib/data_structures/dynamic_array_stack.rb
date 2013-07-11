class DynamicArrayStack
  def initialize(items = [])
    @items = items
  end

  def pop
    @items.pop
  end

  def push(item)
    @items.push(item)
  end
end
