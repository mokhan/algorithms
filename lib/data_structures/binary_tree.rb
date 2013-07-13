require_relative "../utility/block_visitor"
require_relative "../utility/total_count_visitor"
require_relative "pre_order_traversal"

class BinaryTree
  def push(item)
    if @root
      @root.push(item)
    else
      @root = BinaryTreeNode.new(item) unless @root
    end
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
        if @left
          @left.push(item)
        else
          @left = BinaryTreeNode.new(item)
        end
      else
        if @right
          @right.push(item)
        else
          @right = BinaryTreeNode.new(item)
        end
      end
    end

    def accept(visitor, traversal)
      traversal.traverse(self, visitor)
    end
  end
end
