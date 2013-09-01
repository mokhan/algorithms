class InOrderTraversal
  def traverse(node, visitor)
    node.left.accept(visitor, self) if node.left
    visitor.visit(node)
    node.right.accept(visitor, self) if node.right
  end
end
