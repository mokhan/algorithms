class PostOrderTraversal
  def traverse(node, visitor)
    node.left.accept(visitor, self) if node.left
    node.right.accept(visitor, self) if node.right
    visitor.visit(node)
  end
end
