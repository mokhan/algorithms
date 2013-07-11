class LinkedListStack
  def initialize
    @head = Node.new(nil)
  end

  def push(item)
    @head.push(item)
  end

  def pop
    @head.pop
  end

  def count
    0
  end
end

class Node
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def push(item)
    @next.push(item) if @next
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
