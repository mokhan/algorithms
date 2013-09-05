require "spec_helper"
require "ostruct"

def dfs(node)
  stack = [node]
  until stack.empty? do
    top = stack.pop
    p top.name
    top.children.reverse_each { |x| stack.push(x) }
  end
end

describe "dfs" do
  it "should visit each item" do
    nailah = OpenStruct.new(:name => "nini", :children => [])
    adia = OpenStruct.new(:name => "adia", :children => [])
    allison = OpenStruct.new(:name => "alli", :children => [adia, nailah])
    caius = OpenStruct.new(:name => "caius", :children => [])
    reeves = OpenStruct.new(:name => "reeves", :children => [])
    lisa = OpenStruct.new(:name => "lisa", :children => [caius, reeves])
    sandi = OpenStruct.new(:name => "sandi", :children => [allison, lisa])
    dfs(sandi)
  end
end
