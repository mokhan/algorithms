class QuickUnion
  def initialize(size)
    @items = Array.new(size) { |n| n }
    @size = Array.new(size, 0)
  end

  def union(x, y)
    i = root_of(x)
    j = root_of(y)
    return if (i == j)

    if @size[i] < @size[j]
      @items[i] = j
      @size[j] = @size[j] + @size[i]
    else
      @items[j] = i
      @size[i] = @size[i] + @size[j]
    end
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
