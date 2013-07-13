require "spec_helper"

#Tree data structure
#each node has at most two children
#nodes with children are parent nodes.
describe BinaryTree do
  let(:sut) { BinaryTree.new }

  context "when there are no items in the tree" do
    it "should have a size of 0" do
      sut.size.should == 0
    end
  end

  context "when many items are pushed on to the tree" do
    before :each do
      10.times do |n|
        sut.push(n)
      end
    end

    it "should increase the size" do
      sut.size.should == 10
    end

    it "can iterate through each item" do
      sut.each do |item|
        item.should_not be_nil
      end
    end
  end
end
