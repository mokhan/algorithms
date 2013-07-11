class MergeSort
  def sort(items)
    return items if items.size <= 1
    pivot = items.size/2
    left, right = items[0...pivot], items[pivot...items.size]
    merge(sort(left), sort(right))
  end

  private

  def merge(left, right)
    result = []
    result << ((left.first <=> right.first) == -1 ? left.shift : right.shift) until left.empty? || right.empty?
    result + left + right
  end
end
