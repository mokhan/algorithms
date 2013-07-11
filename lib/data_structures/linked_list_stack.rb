class LinkedListStack
  def initialize
    @head = NullNode.new
  end

  def push(item)
    @head.push(item)
  end

  def pop
    @head.pop
  end
end

class Node
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def push(item)
    if @next 
      @next.push(item)
    end

    @next = Node.new(item)
  end

  def pop
    if @next
      if @next.is_tail?
        result = @next.data
        @next = nil
        result
      else
        @next.pop
      end
    end
  end

  def is_tail?
    @next == nil
  end
end

class NullNode
  def push(item)
    if @next
      @next.push(item)
    else
      @next = Node.new(item)
    end
  end

  def pop
    return @next.pop if @next
  end
end
