class InsertionSort
  def sort(items)
    items.size.times do |n|
      j = n
      while j >= 0 do
        if (items[j] <=> items[j+1]) == 1
          items[j], items[j+1] = items[j+1], items[j]
        end
        j-=1
      end
    end
    items
  end
end
