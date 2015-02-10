require "spec_helper"

describe LinkedListStack do
  let(:sut) { LinkedListStack.new }

  context "when no items are pushed on to the stack" do
    let(:result) { sut.pop }

    it "should pop nil if there is nothing on the stack" do
      expect(result).to be_nil
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
      expect(sut.pop).to eq(n)
    end

    it "should pop off each item in reverse order of how they were put on" do
      (n..1).each do |n|
        expect(sut.pop).to eq(n)
      end
    end

    it "should have the correct number of items" do
      expect(sut.count).to eq(n)
    end
  end
end
