require "spec_helper"

describe DynamicArrayStack do
  let(:sut) { DynamicArrayStack.new }

  context "when there is nothing on the stack" do
    it "should be able to pop off nil" do
      sut.pop.should be_nil
    end
  end

  context "when there is one item on the stack" do
    it "should be able to pop it off" do
      n = rand
      sut.push(n)
      sut.pop.should == n
    end
  end

  context "when there are multiple items on the stack" do
    it "should pop each one off in the right order" do
      (0..10).each do |n|
        sut.push(n)
      end
      (10..0).each do |n|
        sut.pop.should == n
      end
    end
  end
end
