#http://codekata.com/kata/kata02-karate-chop/
require "spec_helper"

# Write a binary chop method that takes an integer search target and a sorted array of integers.
# It should return the integer index of the target in the array, or -1 if the target is not in the array.
# The signature will logically be:

=begin
chop(int, array_of_int)  -> int
=end

# You can assume that the array has less than 100,000 elements.
# For the purposes of this Kata, time and memory performance are not issues (assuming the chop terminates before you get bored and kill it, and that you have enough RAM to run it).


describe "chop" do
  def chop(int, items, r = 0)
    return -1 if items.empty?
    return items[0] == int ? r : -1 if items.length == 1

    mid = items.length / 2
    value = items[mid]

    return r + mid if int == value

    if int > value
      chop(int, items[mid..items.length], mid)
    else
      chop(int, items[0..mid-1])
    end
  end

  def chop(target, items)
    low = 0
    high = items.size

    while low < high
      mid = low + (high-low)/2
      if items[mid] == target
        return mid
      elsif target > items[mid]
        low = mid + 1
      else
        high = mid
      end
    end
    -1
  end

  def assert_equal(expected, actual)
    expect(actual).to eql(expected)
  end

  it 'chops' do
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))
    assert_equal(0,  chop(1, [1]))
    #
    assert_equal(0,  chop(1, [1, 3, 5]))
    assert_equal(1,  chop(3, [1, 3, 5]))
    assert_equal(2,  chop(5, [1, 3, 5]))
    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))
    #
    assert_equal(0,  chop(1, [1, 3, 5, 7]))
    assert_equal(1,  chop(3, [1, 3, 5, 7]))
    assert_equal(2,  chop(5, [1, 3, 5, 7]))
    assert_equal(3,  chop(7, [1, 3, 5, 7]))
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
  end
end
