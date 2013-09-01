class PreOrderTraversal
  def traverse(node, visitor)
    visitor.visit(node)
    node.left.accept(visitor, self) if node.left
    node.right.accept(visitor, self) if node.right
  end
end
