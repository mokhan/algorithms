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
#   1,  8,  3,  2,  9
# 4. Two times each even digit:
#   2, 16,  6,  4, 18
# 5. Sum the digits of each multiplication:
#   2,  7,  6,  4,  9
# 6. Sum the last:
#   2 + 7 + 6 + 4 + 9 = 28 = s2
#
# s1 + s2 = 70 which ends in zero which means {
# that 49927398716 passes the Luhn test


class Luhn
  def self.valid?(credit_card)
    x = credit_card.digits.each_with_index.inject(Hash.new { |hash, key| hash[key] = [] }) do |memo, (digit, index)|
      index.even? ? memo[:odd].push(digit) : memo[:even].push(digit)
      memo
    end
    step_2 = x[:odd].sum
    step_3 = x[:even]
    step_4 = step_3.map { |x| x * 2 }
    step_5 = step_4.map { |x| x.digits.sum }
    step_6 = step_5.sum
    (step_2 + step_6).digits[0].zero?
  end
end

RSpec.describe Luhn do
  subject { Luhn }

  describe ".valid?" do
    specify { expect(subject).to be_valid(49927398716) }
    specify { expect(subject).not_to be_valid(49927398717) }
    specify { expect(subject).not_to be_valid(1234567812345678) }
    specify { expect(subject).to be_valid(1234567812345670) }
  end
end
