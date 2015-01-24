require "spec_helper"

describe QuickUnion do
  subject { QuickUnion.new(10) }

  it "is not connected" do
    expect(subject.connected?(0, 1)).to be_false
  end

  it "is connected" do
    subject.union(4, 3)
    subject.connected?(4, 3).should be_true
    subject.union(3, 8)
    subject.connected?(3, 8).should be_true
    subject.union(6, 5)
    subject.connected?(6, 5).should be_true

    subject.union(9, 4)
    subject.connected?(9, 4).should be_true

    subject.union(2, 1)
    subject.connected?(8, 9).should be_true
    subject.connected?(5, 4).should be_false
    subject.union(5, 0)
    subject.connected?(5, 0).should be_true
    subject.union(7, 2)
    subject.connected?(7, 2).should be_true
    subject.union(6, 1)
    subject.connected?(6, 1).should be_true
    subject.union(7, 3)
    subject.connected?(7, 3).should be_true
  end
end
