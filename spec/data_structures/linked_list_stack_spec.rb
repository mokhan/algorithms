require "spec_helper"

describe LinkedListStack do
  let(:sut) { LinkedListStack.new }

  context "when no items are pushed on to the stack" do
    let(:result) { sut.pop }

    it "should pop nil if there is nothing on the stack" do
      result.should be_nil
    end
  end

  context "when a single item is pushed on to the stack" do
    it "should pop the last item pushed on to the stack" do
      sut.push(1)
      sut.push(2)
      result = sut.pop
      result.should == 2
    end

    it "should pop off each item in reverse order of how they were put on" do
      (1..10).each do |n|
        sut.push(n)
      end
      (10..1).each do |n|
        sut.pop.should == n
      end
    end
  end
end
