class AVLTree
  def initialize
  end

  def push(item)
    if @root
      @root.push(item)
    else
      @root = Node.new(item)
    end
  end

  def size
    return 0 unless @root
    @root.size
  end

  def height
    return 0 unless @root
    @root.height
  end

  alias_method :add, :push

  class Node
    def initialize(data)
      @data = data
    end

    def push(item)
      if (item <=> @data) == -1
        @left.push(item) if @left
        @left = Node.new(item) unless @left
      else
        @right.push(item) if @right
        @right = Node.new(item) unless @right
      end
    end

    def size
      result = 1
      result += @left.size if @left
      result += @right.size if @right
      result
    end

    def height
      result = 1
      left_height = @left ? @left.height : 0
      right_height = @right ? @right.height : 0
      result += left_height >= right_height ? left_height : right_height
      result
    end
  end
end
