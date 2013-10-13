class InOrderTraversal
  def traverse(node, visitor)
    visitor.visit(node.left) if node.left
    visitor.visit(node)
    visitor.visit(node.right) if node.right
  end
end
