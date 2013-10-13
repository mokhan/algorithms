require "spec_helper"

describe "inorder traversal" do
  let(:sut) { InOrderTraversal.new }
  let(:node) { double }
  let(:left_node) { double }
  let(:right_node) { double }
  let(:visitor) { double('visitor', :visit => nil) }

  before :each do
    node.stub(:left).and_return(left_node)
    node.stub(:right).and_return(right_node)
    sut.traverse(node, visitor)
  end

  it "should visit the left node first" do
    visitor.should have_received(:visit).with(left_node)
  end

  it "should visit the current node second" do
    visitor.should have_received(:visit).with(node)
  end

  it "should visit the right node last" do
    visitor.should have_received(:visit).with(right_node)
  end
end
