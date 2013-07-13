class BlockVisitor
  def initialize(&block)
    @block = block
  end

  def visit(item)
    @block.call(item)
  end
end
