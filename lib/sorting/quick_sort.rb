class QuickSort
  def sort(items)
    return items if items.size <= 1

    #pivot = items[rand(items.size)]
    pivot = items.sample
    less, pivots, greater = [], [], []
    items.each do |x|
      comparison = x <=> pivot
      if comparison == -1
        less << x
      elsif comparison == 1
        greater << x
      else
        pivots << x
      end
    end
    sort(less) + pivots + sort(greater)
  end
end
