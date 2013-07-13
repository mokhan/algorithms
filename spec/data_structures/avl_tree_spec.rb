require "spec_helper"

describe AVLTree do
  let(:sut) { AVLTree.new }

  context "when empty" do
    it "should have a size of 0" do
      sut.size.should == 0
    end

    it "should have have a height of 0" do
      sut.height.should == 0
    end
  end

  context "when a single item is added" do
    before :each do
      sut.push("A")
    end

    it "should have a size of 1" do
      sut.size.should == 1
    end

    it "should have a height of 1" do
      sut.height.should == 1
    end
  end

  context "when two items are added" do
    before :each do
      sut.add("a")
      sut.add("b")
    end

    it "should have a size of 2" do
      sut.size.should == 2
    end
    it "should have a height of 2" do
      sut.height.should == 2
    end
  end

  context "when a balanced tree has 3 items" do
    before :each do
      sut.add("b")
      sut.add("a")
      sut.add("c")
    end

    it "should have a size of 3" do
      sut.size.should == 3
    end

    it "should have a height of 2" do
      sut.height.should == 2
    end
  end

  context "when adding an item that would cause the tree to be unbalanced" do
    it "should re-balance it self" do
      
    end
  end
end
