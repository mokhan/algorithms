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

  class TotalCountVisitor
    attr_reader :result

    def initialize
      @result = 0
    end

    def visit(item)
      @result += 1
    end
  end
end

class PreOrderTraversal
  def traverse(node, visitor)
    visitor.visit(node)
    node.left.accept(visitor, self) if node.left
    node.right.accept(visitor, self) if node.right
  end
end
