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

  def accept(visitor)
    @root.accept(visitor) if @root
  end

  class BinaryTreeNode
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

    def accept(visitor)
      visitor.visit(self)
      @left.accept(visitor) if @left
      @right.accept(visitor) if @right
    end

  end

  class TotalCountVisitor
    attr_reader :result
    def initialize
      @result = 0
    end

    def visit(item)
      p item
      @result += 1
    end
  end
end
