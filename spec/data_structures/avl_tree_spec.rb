require "spec_helper"

describe AVLTree do
  let(:sut) { AVLTree.new }

  context "when empty" do
    it "should have a size of 0" do
      expect(sut.size).to eq(0)
    end

    it "should have have a height of 0" do
      expect(sut.height).to eq(0)
    end
  end

  context "when a single item is added" do
    before :each do
      sut.push("A")
    end

    it "should have a size of 1" do
      expect(sut.size).to eq(1)
    end

    it "should have a height of 1" do
      expect(sut.height).to eq(1)
    end
  end

  context "when two items are added" do
    before :each do
      sut.add("a")
      sut.add("b")
    end

    it "should have a size of 2" do
      expect(sut.size).to eq(2)
    end
    it "should have a height of 2" do
      expect(sut.height).to eq(2)
    end
  end

  context "when a balanced tree has 3 items" do
    before :each do
      sut.add("b")
      sut.add("a")
      sut.add("c")
    end

    it "should have a size of 3" do
      expect(sut.size).to eq(3)
    end

    it "should have a height of 2" do
      expect(sut.height).to eq(2)
    end
  end

  context "when the tree is unbalanced" do
    context "with a right-right case" do
      before :each do
        sut.add("a")
        sut.add("b")
        sut.add("c")
      end

      it "should re-balance it self" do
        expect(sut.height).to eq(2)
      end

      it "should have a new root" do
        expect(sut.root.data).to eq("b")
      end

      it "should change the left side" do
        expect(sut.root.left.data).to eq("a")
      end

      it "should change the right side" do
        expect(sut.root.right.data).to eq("c")
      end
    end

    context "with a left-left case" do
      before :each do
        sut.add("c")
        sut.add("b")
        sut.add("a")
      end

      it "should re-balance it self" do
        expect(sut.height).to eq(2)
      end

      it "should have a new root" do
        expect(sut.root.data).to eq("b")
      end

      it "should change the left side" do
        expect(sut.root.left.data).to eq("a")
      end

      it "should change the right side" do
        expect(sut.root.right.data).to eq("c")
      end
    end

    context "with a left-right case" do
      before :each do
        sut.add(5)
        sut.add(3)
        sut.add(4)
      end

      it "should adjust the height" do
        expect(sut.height).to eq(2)
      end

      it "should have a new root" do
        expect(sut.root.data).to eq(4)
      end

      it "should have a proper left side" do
        expect(sut.root.left.data).to eq(3)
      end

      it "should have a proper right side" do
        expect(sut.root.right.data).to eq(5)
      end
    end

    context "with a right-left case" do
      before :each do
        sut.add(3)
        sut.add(5)
        sut.add(4)
      end

      it "should adjust the height" do
        expect(sut.height).to eq(2)
      end

      it "should have a new root" do
        expect(sut.root.data).to eq(4)
      end

      it "should have a proper left side" do
        expect(sut.root.left.data).to eq(3)
      end

      it "should have a proper right side" do
        expect(sut.root.right.data).to eq(5)
      end
    end
  end
end
