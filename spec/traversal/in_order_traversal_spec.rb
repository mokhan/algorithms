require "spec_helper"

describe "inorder traversal" do
  subject { InOrderTraversal.new }
  let(:node) { double }
  let(:left_node) { double }
  let(:right_node) { double }
  let(:visitor) { double('visitor', :visit => nil) }

  before :each do
    allow(node).to receive(:left).and_return(left_node)
    allow(node).to receive(:right).and_return(right_node)
    subject.traverse(node, visitor)
  end

  it "should visit the left node first" do
    expect(visitor).to have_received(:visit).with(left_node)
  end

  it "should visit the current node second" do
    expect(visitor).to have_received(:visit).with(node)
  end

  it "should visit the right node last" do
    expect(visitor).to have_received(:visit).with(right_node)
  end
end
