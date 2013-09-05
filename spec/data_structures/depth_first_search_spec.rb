require "spec_helper"
require "ostruct"

def dfs(node)
  stack = [node]
  until(stack.empty?) do
    top = stack.pop
    p top.name
    stack.push(top.left) if top.left
    stack.push(top.right) if top.right
  end
end

describe "dfs" do
  it "should visit each item" do
    nailah = OpenStruct.new(:name => "nini", :left => nil, :right => nil)
    adia = OpenStruct.new(:name => "adia", :left => nil, :right => nil)
    allison = OpenStruct.new(:name => "alli", :left => adia, :right => nailah)
    caius = OpenStruct.new(:name => "caius", :left => nil, :right => nil)
    reeves = OpenStruct.new(:name => "reeves", :left => nil, :right => nil)
    lisa = OpenStruct.new(:name => "lisa", :left => caius, :right => reeves)
    sandi = OpenStruct.new(:name => "sandi", :left => allison, :right => lisa)
    dfs(sandi)
  end
end
