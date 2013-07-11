class BubbleSort
  def sort(items)
    return items if items.size <= 1

    swapped = false
    loop do
      items.size.times do |n|
        if (items[n] <=> items[n+1]) == 1
          items[n], items[n+1] = items[n+1], items[n]
          swapped = true
        end
      end
      break unless swapped
      swapped = false
    end
    items
  end
end
