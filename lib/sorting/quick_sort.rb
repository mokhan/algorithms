class QuickSort
  def sort(items)
    return items if items.size <= 1

    pivot = items[rand(items.size)]
    less, pivots, greater = [], [], []
    items.each do |x|
      if x < pivot
        less << x
      elsif x > pivot
        greater << x
      else
        pivots << x
      end
    end
    sort(less) + pivots + sort(greater)
  end
end
