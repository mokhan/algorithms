require "spec_helper"
require "ostruct"

def dijkstra(graph, source, destination)
  heap = Heap.new
  heap.push(0, source)
  total_cost = 0
  until (heap.empty?) do
    top = heap.min
    distance = graph.distance_between(source, top) || 0
    total_cost += distance
    p "#{source.name} -> #{top.name} (#{distance})"
    return total_cost if top == destination
    neighbors = graph.neighbors(top)
    neighbors.each do |x|
      heap.push(graph.distance_between(source, x) || 100, x)
    end
    source = top
  end
end

describe "dijkstra" do
  let(:a) { node(:name => "A") }
  let(:b) { node(:name => "B") }
  let(:c) { node(:name => "C") }
  let(:d) { node(:name => "D") }
  let(:e) { node(:name => "E") }
  let(:graph) { Graph.new }

  before :each do
    graph.push(a)
    graph.push(b)
    graph.push(c)
    graph.push(d)
    graph.push(e)
    graph.connect(a, b, 5)
    graph.connect(a, d, 5)
    graph.connect(a, e, 7)
    graph.connect(b, c, 4)
    graph.connect(c, d, 8)
    graph.connect(c, e, 2)
    graph.connect(d, c, 8)
    graph.connect(d, e, 6)
    graph.connect(e, b, 3)
  end

  it "A-B-C should == 9" do
    dijkstra(graph, a, c).should == 9
  end

  it "A-D should == 5" do
    dijkstra(graph, a, d).should == 5
  end

  def node(details)
    OpenStruct.new(details)
  end
end

class Edge
  attr_reader :source, :destination, :distance

  def initialize(source, destination, distance)
    @source = source
    @destination = destination
    @distance = distance
  end
end

class Graph < Array
  attr_reader :edges

  def initialize(edges = [])
    @edges = []
  end

  def connect(source, destination, distance)
    @edges.push(Edge.new(source, destination, distance))
  end

  def neighbors(vertex)
    neighbors = []
    @edges.each do |edge|
      if edge.source == vertex
        neighbors.push(edge.destination)
      end
    end
    neighbors
  end

  def distance_between(source, destination)
    @edges.each do |edge|
      return edge.distance if edge.source == source and edge.destination == destination
    end
    nil
  end
end
