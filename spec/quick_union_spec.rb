require "spec_helper"

describe QuickUnion do
  subject { QuickUnion.new(10) }

  it "is not connected" do
    expect(subject.connected?(0, 1)).to be_falsey
  end

  it "is connected" do
    subject.union(4, 3)
    expect(subject.connected?(4, 3)).to be_truthy
    subject.union(3, 8)
    expect(subject.connected?(3, 8)).to be_truthy
    subject.union(6, 5)
    expect(subject.connected?(6, 5)).to be_truthy

    subject.union(9, 4)
    expect(subject.connected?(9, 4)).to be_truthy

    subject.union(2, 1)
    expect(subject.connected?(8, 9)).to be_truthy
    expect(subject.connected?(5, 4)).to be_falsey
    subject.union(5, 0)
    expect(subject.connected?(5, 0)).to be_truthy
    subject.union(7, 2)
    expect(subject.connected?(7, 2)).to be_truthy
    subject.union(6, 1)
    expect(subject.connected?(6, 1)).to be_truthy
    subject.union(7, 3)
    expect(subject.connected?(7, 3)).to be_truthy
  end
end
