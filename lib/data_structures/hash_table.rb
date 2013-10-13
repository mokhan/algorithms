class HashTable
  MAX_SIZE = 64

  def initialize(items = [], max = MAX_SIZE)
    @items = items
    @max = max
  end

  def []=(key, value)
    @items[key.hash % @max] = value
  end

  def [](key)
    @items[key.hash % @max]
  end
end
