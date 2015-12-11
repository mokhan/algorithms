require "spec_helper"

describe AVLTree do
  subject { AVLTree.new }

  context "when empty" do
    it "should have a size of 0" do
      expect(subject.size).to eq(0)
    end

    it "should have have a height of 0" do
      expect(subject.height).to eq(0)
    end
  end

  context "when a single item is added" do
    before :each do
      subject.push("A")
    end

    it "should have a size of 1" do
      expect(subject.size).to eq(1)
    end

    it "should have a height of 1" do
      expect(subject.height).to eq(1)
    end
  end

  context "when two items are added" do
    before :each do
      subject.add("a")
      subject.add("b")
    end

    it "should have a size of 2" do
      expect(subject.size).to eq(2)
    end
    it "should have a height of 2" do
      expect(subject.height).to eq(2)
    end
  end

  context "when a balanced tree has 3 items" do
    before :each do
      subject.add("b")
      subject.add("a")
      subject.add("c")
    end

    it "should have a size of 3" do
      expect(subject.size).to eq(3)
    end

    it "should have a height of 2" do
      expect(subject.height).to eq(2)
    end
  end

  context "when the tree is unbalanced" do
    context "with a right-right case" do
      before :each do
        subject.add("a")
        subject.add("b")
        subject.add("c")
      end

      it "should re-balance it self" do
        expect(subject.height).to eq(2)
      end

      it "should have a new root" do
        expect(subject.root.data).to eq("b")
      end

      it "should change the left side" do
        expect(subject.root.left.data).to eq("a")
      end

      it "should change the right side" do
        expect(subject.root.right.data).to eq("c")
      end
    end

    context "with a left-left case" do
      before :each do
        subject.add("c")
        subject.add("b")
        subject.add("a")
      end

      it "should re-balance it self" do
        expect(subject.height).to eq(2)
      end

      it "should have a new root" do
        expect(subject.root.data).to eq("b")
      end

      it "should change the left side" do
        expect(subject.root.left.data).to eq("a")
      end

      it "should change the right side" do
        expect(subject.root.right.data).to eq("c")
      end
    end

    context "with a left-right case" do
      before :each do
        subject.add(5)
        subject.add(3)
        subject.add(4)
      end

      it "should adjust the height" do
        expect(subject.height).to eq(2)
      end

      it "should have a new root" do
        expect(subject.root.data).to eq(4)
      end

      it "should have a proper left side" do
        expect(subject.root.left.data).to eq(3)
      end

      it "should have a proper right side" do
        expect(subject.root.right.data).to eq(5)
      end
    end

    context "with a right-left case" do
      before :each do
        subject.add(3)
        subject.add(5)
        subject.add(4)
      end

      it "should adjust the height" do
        expect(subject.height).to eq(2)
      end

      it "should have a new root" do
        expect(subject.root.data).to eq(4)
      end

      it "should have a proper left side" do
        expect(subject.root.left.data).to eq(3)
      end

      it "should have a proper right side" do
        expect(subject.root.right.data).to eq(5)
      end
    end
  end
end
