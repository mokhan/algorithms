require "spec_helper"

describe QuickFind do
  subject { QuickFind.new(10) }

  it "is not connected by default" do
    10.times do |n|
      expect(subject.connected?(n, n+1)).to be_false
    end
  end

  it "is connected" do
    subject.union(0, 1)
    expect(subject.connected?(0, 1)).to be_true
  end

  it "unions and connects properly" do
    subject.union(4, 3)
    expect(subject.connected?(4, 3)).to be_true
    expect(subject.connected?(3, 4)).to be_true

    subject.union(3, 8)
    expect(subject.connected?(3, 8)).to be_true

    subject.union(6, 5)
    expect(subject.connected?(6, 5)).to be_true

    subject.union(9, 4)
    expect(subject.connected?(9, 4)).to be_true

    subject.union(2, 1)
    expect(subject.connected?(2, 1)).to be_true

    subject.union(8, 9)
    expect(subject.connected?(8, 9)).to be_true

    expect(subject.connected?(5, 0)).to be_false
    subject.union(5, 0)
    expect(subject.connected?(5, 0)).to be_true
    expect(subject.connected?(6, 0)).to be_true
    expect(subject.connected?(5, 6)).to be_true

    subject.union(7, 2)
    subject.union(6, 1)

    tuples = [
      [0, 5],
      [5, 6],
      [6, 1],
      [1, 2],
      [2, 7],
      [8, 3],
      [3, 4],
      [4, 9],
    ]
    tuples.each do |tuple|
      expect(subject.connected?(tuple.first, tuple.last)).to be_true
    end
  end
end
