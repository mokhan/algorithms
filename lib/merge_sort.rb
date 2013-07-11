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
    while left.size > 0 && right.size > 0 do
      if left[0] < right[0]
        result << left.shift
      else
        result << right.shift
      end
    end
    result + left + right
  end
end
