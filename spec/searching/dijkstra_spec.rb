require "spec_helper"
require "ostruct"

def dijkstra(node)
  heap = Heap.heapify([node])
  until (heap.empty?) do
    top = heap.min
    top.children.each { |x| heap.push(x) }
  end
end

describe "dijkstra" do
  it "should visit each item" do
    nailah = OpenStruct.new(:name => "nini", :children => [])
    adia = OpenStruct.new(:name => "adia", :children => [])
    allison = OpenStruct.new(:name => "alli", :children => [adia, nailah])
    caius = OpenStruct.new(:name => "caius", :children => [])
    reeves = OpenStruct.new(:name => "reeves", :children => [])
    lisa = OpenStruct.new(:name => "lisa", :children => [caius, reeves])
    sandi = OpenStruct.new(:name => "sandi", :children => [allison, lisa])
    dijkstra(sandi)
  end
end
