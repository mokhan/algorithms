class QuickFind
  def initialize(size)
    @items = []
    size.times.each do |n|
      @items[n] = n
    end
  end

  def connected?(x, y)
    @items[x] == @items[y]
  end

  def union(x, y)
    x_value = @items[x]
    y_value = @items[y]

    @items.size.times do |n|
      if @items[n] == x_value
        @items[n] = y_value
      end
    end
  end
end
