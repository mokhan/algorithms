require 'spec_helper'

describe "combinations of strings" do
  def permutation(string)
    return [string] if string.size < 2
    return [string, string.reverse] if string.size == 2

    character = string[-1]
    permutation(string.chop).inject([]) do |results, permutation|
      0.upto(permutation.size) do |position|
        results << permutation.clone.insert(position, character)
      end
      results
    end
  end

  it 'produces each combination of 1' do
    expect(permutation('a')).to match_array(['a'])
  end

  it 'produces each combination of 2' do
    # 'ab' => ["ab", "ba"]
    results = permutation('ab')
    expected = 'ab'.chars.permutation.map(&:join).to_a
    expect(results).to match_array(expected)
  end

  it 'produces each combination of 3' do
    # 'abc' => ["abc", "acb", "bac", "bca", "cab", "cba"]
    results = permutation('abc')
    expected = 'abc'.chars.permutation.map(&:join).to_a
    expect(results).to match_array(expected)
    expect(results.length).to eql(6)
  end
end
