class QuickUnion
  def initialize(size)
    @items = Array.new(size) { |n| n }
  end

  def union(x, y)
    @items[x] = root_of(y)
  end

  def connected?(x, y)
    root_of(x) == root_of(y)
  end

  private

  def root_of(x)
    x = @items[x] until @items[x] == x
    x
  end
end
