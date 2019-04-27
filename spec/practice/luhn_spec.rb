require "spec_helper"

# The Luhn test is used by some credit card companies to
# distinguish valid credit card numbers from what could
# be a random selection of digits.
#
# For example, if the trial number is 49927398716:
#
# 1. Reverse the digits:
#   61789372994
# 2. Sum the odd digits:
#   6 + 7 + 9 + 7 + 9 + 4 = 42 = s1
# 3. The even digits:
#     1,  8,  3,  2,  9
#   4. Two times each even digit:
#     2, 16,  6,  4, 18
#   5. Sum the digits of each multiplication:
#     2,  7,  6,  4,  9
#   6. Sum the last:
#     2 + 7 + 6 + 4 + 9 = 28 = s2
#
# s1 + s2 = 70 which ends in zero which means {
# that 49927398716 passes the Luhn test


class Luhn
  def self.valid?(cc)
    reversed_cc = cc.to_s.reverse

    step6 = sum(step_5(digits_from(reversed_cc, :odd?).map { |x| x.to_i * 2 }))
    (step6.to_i + sum(digits_from(reversed_cc, :even?))).to_s[-1] == '0'
  end

  def self.sum(digits)
    digits.map { |x| x.to_i }.sum
  end

  def self.digits_from(items, predicate)
    results = []
    items.chars.each_with_index do |item, index|
      results << item if index.send(predicate)
    end
    results
  end

  def self.step_5(digits)
    digits.map do |x|
      sum(x.to_s.chars)
    end
  end
end

RSpec.describe Luhn do
  subject { Luhn }

  describe ".odd_digits" do
    specify { expect(Luhn.digits_from("12345", :even?)).to match_array(["1", "3", "5"]) }
    specify do
      expect(Luhn.digits_from("61789372994", :even?)).to match_array(['6', '7', '9', '7', '9', '4'])
    end
  end

  describe ".sum" do
    specify { expect(subject.sum(['6', '7', '9', '7', '9', '4'])).to eql(42) }
  end

  describe ".step_5" do
    specify { expect(subject.step_5([2, 16,  6,  4, 18])).to match_array([2,  7,  6,  4,  9]) }
  end

  it 'passes 49927398716' do
    expect(Luhn.valid?(49927398716)).to be true
  end

  it 'fails 49927398717' do
    expect(Luhn.valid?(49927398717)).to be false
  end

  it 'fails 1234567812345678' do
    expect(Luhn.valid?(1234567812345678)).to be false
  end

  it 'passes 1234567812345670' do
    expect(Luhn.valid?(1234567812345670)).to be true
  end
end
