require 'byebug'
# Write a class with four methods:
# An #initialize(value) method that sets the value, and starts parent as nil, and children to an empty array.
# A #parent method that returns the node's parent.
# A #children method that returns an array of children of a node.
# A #value method that returns the value stored at the node.
# Write a #parent= method which (1) sets the parent property and (2) adds the node to their parent's array of children (unless we're setting parent to nil).
class PolyTreeNode

  attr_reader :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil # what is the node that is a parent of this node
    @children = []
  end

  def parent=(p_node)
    if p_node.nil?
      @parent.children.delete(self)
      @parent = nil
    else
      @parent.children.delete(self) unless @parent.nil?
      @parent = p_node
      @parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    self.children.delete(child_node)
    child_node.parent = nil
  end

  # Write a #dfs(target_value) method which takes a value to search for and performs the search. Write this recursively.
  # First, check the value at this node. If a node's value matches the target value, return the node.
  # If not, iterate through the #children and repeat.

  def dfs(target)
    return self if self.value == target
    @children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target
      queue.concat(current_node.children)
    end
    nil
  end

end
