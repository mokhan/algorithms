class AVLTree
  attr_reader :root

  def push(item)
    p "insert #{item}"
    if @root
      @root = @root.push(item)
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
    attr_accessor :data, :left, :right

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
      re_balance
    end

    def size
      result = 1
      result += @left.size if @left
      result += @right.size if @right
      result
    end

    def height
      result = 1
      result += left_height >= right_height ? left_height : right_height
      result
    end

    def re_balance
      p balance_factor
      if balance_factor < -1
        p "right right case"
        @right.left = self
        new_root = @right
        @right = nil
        new_root
      else
        self
      end
    end

    private

    def balance_factor
      p "left: #{left_height}, right: #{right_height}"
      (left_height - right_height) || 0
    end

    def left_height
      @left ? @left.height : 0
    end

    def right_height
      @right ? @right.height : 0
    end
  end
end
