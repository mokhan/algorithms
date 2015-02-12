#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
describe "problem five" do
  def divisible_by?(number)
    return number % 2 == 0 &&
      number % 3 == 0 &&
      number % 4 == 0 &&
      number % 5 == 0 &&
      number % 6 == 0 &&
      number % 7 == 0 &&
      number % 8 == 0 &&
      number % 9 == 0 &&
      number % 10 == 0 &&
      number % 11 == 0 &&
      number % 12 == 0 &&
      number % 13 == 0 &&
      number % 14 == 0 &&
      number % 15 == 0 &&
      number % 16 == 0 &&
      number % 17 == 0 &&
      number % 18 == 0 &&
      number % 19 == 0 &&
      number % 20 == 0
  end

  def smallest
    n = 20
    loop do
      return n if divisible_by?(n)
      n = n + 20
    end
  end

  it 'produces the answer' do
    expect(smallest).to eql(232792560)
  end
end
