require "spec_helper"

describe LinkedListStack do
  let(:sut) { LinkedListStack.new }

  context "when no items are pushed on to the stack" do
    let(:result) { sut.pop }

    it "should pop nil if there is nothing on the stack" do
      result.should be_nil
    end
  end

  context "when a multiple items are pushed on to the stack" do
    let(:n) { 10 }

    before :each do
      (1..n).each do |n|
        sut.push(n)
      end
    end
    it "should pop the last item pushed on to the stack" do
      sut.pop.should == n
    end

    it "should pop off each item in reverse order of how they were put on" do
      (n..1).each do |n|
        sut.pop.should == n
      end
    end

    it "should have the correct number of items" do
      sut.count.should == n
    end
  end
end
