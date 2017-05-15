require 'spec_helper'
description = <<-PROBLEM
Given an array of integers,
return indicies of the two numbers such that they add up to a specific target.
PROBLEM

describe description do
  def two_sum(numbers, target:)
    items = {}
    numbers.each_with_index do |number, index|
      next if number > target
      if other_index = items[target - number]
        return [index, other_index].sort
      end
      items[number] = index
    end
  end

  it 'returns 2 + 7' do
    numbers = [2, 7, 11, 15]
    results = two_sum(numbers, target: 9)
    expect(results).to eql([0, 1])
  end

  it 'returns 2 + 4' do
    numbers = [3, 2, 4]
    results = two_sum(numbers, target: 6)
    expect(results).to eql([1, 2])
  end
end
