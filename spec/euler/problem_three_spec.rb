require 'prime'

#The prime factors of 13195 are 5, 7, 13 and 29.

#What is the largest prime factor of the number 600851475143 ?
class OptimusPrime
  def factors_of(number)
    return [] if number == 1
    lowest_prime = 1
    each do |prime|
      if number % prime == 0
        lowest_prime = prime
        break
      end
    end
    ([lowest_prime] + factors_of(number / lowest_prime)).flatten
  end

  private

  def each(&block)
    Prime.each(&block)
  end
end
describe 'problem three' do
  subject { OptimusPrime.new }

  it 'returns prime factorization' do
    expect(subject.factors_of(13195)).to match_array([5, 7, 13, 29])
  end

  it 'returns the answer' do
    expect(subject.factors_of(600851475143)).to match_array([71, 839, 1471, 6857])
  end

  it 'returns the answer to 65' do
    expect(subject.factors_of(65)).to match_array([5, 13])
  end

  it 'returns the answer to 38' do
    expect(subject.factors_of(38)).to match_array([2, 19])
  end

  it 'returns the answer to 48' do
    expect(subject.factors_of(48)).to match_array([2, 2, 2, 2, 3])
  end

  it 'returns the answer to 64' do
    expect(subject.factors_of(64)).to match_array([2, 2, 2, 2, 2, 2])
  end
end
