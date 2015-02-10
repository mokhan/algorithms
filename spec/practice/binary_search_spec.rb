require "spec_helper"

def binary_search(items, target)
  lo = 1
  hi = items.size
  while lo <= hi
    mid = lo + (hi-lo)/2
    if items[mid] == target
      return items[mid]
    elsif items[mid] < target
      lo = mid + 1
    else
      hi = mid - 1
    end
  end
  nil
end

describe "binary search" do
  it "should find the number" do
    items = [0, 5, 13, 19, 22, 41, 55, 68, 72, 81, 98]
    result = binary_search(items, 55)
    expect(result).to eq(55)
  end
end
