require "spec_helper"

def sum_of_all_multiples_under(number)
  matches = ->  (n) { n % 3 == 0 || n % 5 == 0 }
  (0...number).inject(0) do |sum, next_number|
    matches.call(next_number) ? sum + next_number : sum
  end
end

describe "problem 1" do
  it "finds the sum of all multiples of 3 or 5 below 10" do
    result = sum_of_all_multiples_under(10)
    expect(result).to eq(23)
  end

  it "finds the sum of all multiples of 3 or 5 below 1000" do
    result = sum_of_all_multiples_under(1000)
    expect(result).to eq(233_168)
  end
end
