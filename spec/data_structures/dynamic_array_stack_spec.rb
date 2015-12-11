require "spec_helper"

describe DynamicArrayStack do
  subject { DynamicArrayStack.new }

  context "when there is nothing on the stack" do
    it "should be able to pop off nil" do
      expect(subject.pop).to be_nil
    end
  end

  context "when there is one item on the stack" do
    it "should be able to pop it off" do
      n = rand
      subject.push(n)
      expect(subject.pop).to eq(n)
    end
  end

  context "when there are multiple items on the stack" do
    it "should pop each one off in the right order" do
      (0..10).each do |n|
        subject.push(n)
      end
      (10..0).each do |n|
        expect(subject.pop).to eq(n)
      end
    end
  end
end
