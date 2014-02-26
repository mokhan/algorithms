require "spec_helper"

describe "problem 1" do
  it "finds the sum of all multiples of 3 or 5 below 10" do
    result = sum_of_all_multiples_under(10)
    result.should == 23
  end

  xit "finds the sum of all multiples of 3 or 5 below 1000" do
    result = sum_of_all_multiples_under(10)
    result.should == 0
  end
end
