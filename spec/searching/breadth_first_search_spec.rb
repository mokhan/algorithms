require "spec_helper"
require "ostruct"

def bfs(node)
  queue = []
  queue.push({:node => node, :level => 0})
  until (queue.empty?) do
    top = queue.shift
    p "#{top[:level]} #{top[:node].name}"
    queue.push({:node => top[:node].left, :level => top[:level]+1}) if top[:node].left
    queue.push({:node => top[:node].right, :level => top[:level]+1}) if top[:node].right
  end
end

describe "bfs" do
  it "should visit each item" do
    nailah = OpenStruct.new(:name => "nini", :left => nil, :right => nil)
    adia = OpenStruct.new(:name => "adia", :left => nil, :right => nil)
    allison = OpenStruct.new(:name => "alli", :left => adia, :right => nailah)
    caius = OpenStruct.new(:name => "caius", :left => nil, :right => nil)
    reeves = OpenStruct.new(:name => "reeves", :left => nil, :right => nil)
    lisa = OpenStruct.new(:name => "lisa", :left => caius, :right => reeves)
    sandi = OpenStruct.new(:name => "sandi", :left => allison, :right => lisa)
    bfs(sandi)
  end
end

