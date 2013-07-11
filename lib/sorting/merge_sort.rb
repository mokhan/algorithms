class MergeSort
  def sort(items)
    return items if items.size <= 1
    pivot = items.size/2
    pivot += 1 unless items.size % 2 == 0
    split = items.each_slice(pivot).to_a
    merge(sort(split[0]), sort(split[1]))
  end

  private

  def merge(left, right)
    result = []
    until left.empty? || right.empty? do
      if (left.first <=> right.first) == -1
        result << left.shift
      else
        result << right.shift
      end
    end
    result + left + right
  end
end
