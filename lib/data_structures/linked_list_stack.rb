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
    visitor = TotalCountVisitor.new
    accept(visitor)
    visitor.result
  end

  def accept(visitor)
    @head.accept(visitor)
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
    else
      @next = Node.new(item)
    end
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

  def accept(visitor)
    visitor.visit(self) if @data
    @next.accept(visitor) unless is_tail?
  end

  def is_tail?
    @next == nil
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
