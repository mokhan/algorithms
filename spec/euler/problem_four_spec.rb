#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

#Find the largest palindrome made from the product of two 3-digit numbers.
describe 'problem four' do
  class Palindrome
    def largest(digits:1)
      min = ([1]  + ([0] * (digits - 1))).flatten.join('').to_i
      max = ([9] * digits).flatten.join('').to_i
      puts [min, max].inspect

      max.downto(min) do |m|
        max.downto(min) do |n|
          result = m * n
          return result if palindrome?(result)
        end
      end
    end

    private

    def palindrome?(number)
      number.to_s == number.to_s.reverse
    end
  end

  subject { Palindrome.new }

  it 'can find the largest palindrom that is the product of two one digit numbers' do
    expect(subject.largest(digits: 1)).to eql(9)
  end

  it 'can find the largest palindrom that is the product of two digits' do
    expect(subject.largest(digits: 2)).to eql(9009)
  end

  it 'can find the largest palindrome that is the product of two three digit numbers' do
    expect(subject.largest(digits: 3)).to eql(580085)
  end
end
