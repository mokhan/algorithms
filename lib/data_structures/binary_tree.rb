require_relative "../utility/block_visitor"
require_relative "../utility/total_count_visitor"
require_relative "pre_order_traversal"

class BinaryTree
  def push(item)
    @root.push(item) if @root
    @root = BinaryTreeNode.new(item) unless @root
  end

  def size
    visitor = TotalCountVisitor.new
    accept(visitor)
    visitor.result
  end

  def accept(visitor, traversal = PreOrderTraversal.new)
    @root.accept(visitor, traversal) if @root
  end

  def each(&block)
    accept(BlockVisitor.new(&block))
  end

  class BinaryTreeNode
    attr_reader :left, :right, :data

    def initialize(data)
      @data = data
    end

    def push(item)
      if (item <=> @data) == -1
        @left.push(item) if @left
        @left = BinaryTreeNode.new(item) unless @left
      else
        @right.push(item) if @right
        @right = BinaryTreeNode.new(item) unless @right
      end
    end

    def accept(visitor, traversal)
      traversal.traverse(self, visitor)
    end
  end
end
