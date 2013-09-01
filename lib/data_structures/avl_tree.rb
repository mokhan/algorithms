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
      p "balance factor for:#{data} is #{balance_factor}"
      if balance_factor < -1
        if @right.balance_factor == 1
          right_left_case
        else
          right_right_case
        end
      elsif balance_factor > 1
        if @left.balance_factor == -1
          left_right_case
        else
          left_left_case
        end
      else
        self
      end
    end

    def balance_factor
      (left_height - right_height) || 0
    end

    private

    def right_left_case
      p "right left case"
      right = @right
      @right = right.left
      @right.right = right
      right.left = nil
      right_right_case
    end

    def right_right_case
      p "right right case"
      @right.left = self
      new_root = @right
      @right = nil
      new_root
    end

    def left_right_case
      p "left right case"
      left = @left
      @left = @left.right
      @left.left = left
      left.right = nil
      left_left_case
    end

    def left_left_case
      p "left left case"
      @left.right = self
      new_root = @left
      @left = nil
      new_root
    end

    def left_height
      @left ? @left.height : 0
    end

    def right_height
      @right ? @right.height : 0
    end
  end
end
