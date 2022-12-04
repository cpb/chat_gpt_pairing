class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = TreeNode.new(value)
    else
      @root.insert(value)
    end
  end

  def to_vector
    vector = []

    # Perform a pre-order traversal to convert the tree to a vector
    traverse_pre_order(@root, vector)

    vector
  end

  def traverse_pre_order(node, vector)
    return if node.nil?

    vector << node.value

    # Traverse left subtree
    traverse_pre_order(node.left, vector)
    # Traverse right subtree
    traverse_pre_order(node.right, vector)
  end

  def self.from_vector(vector)
    tree = Tree.new
    tree.root = TreeNode.new(vector[0])

    vector.each do |value|
      tree.insert(value)
    end

    tree
  end

  def depth
    traverse_depth(@root, 0)
  end

  def traverse_depth(node, depth)
    return depth if node.nil?

    left_depth = traverse_depth(node.left, depth + 1)
    right_depth = traverse_depth(node.right, depth + 1)

    [left_depth, right_depth].max
  end
end

class TreeNode
  attr_accessor :value, :children

  # initialize a new TreeNode
  def initialize(value)
    @value = value
    @children = []
  end

  # insert a value into the binary tree
  def insert(value)
    # if the value is less than or equal to this node's value
    # then insert it into the left subtree
    children << TreeNode.new(value)
  end

  # convert the subtree rooted at this node into a vector
  def to_vector
    vector = [value]
    children.each do |child|
      vector.concat(child.to_vector)
    end
    vector
  end
end

RSpec.describe Tree do
  describe '#to_vector' do
    it 'should convert an n-ary tree into a vector' do
      tree = Tree.new
      tree.insert(1)
      tree.insert(2)
      tree.insert(3)

      expect(tree.to_vector).to eq([1,2,3])
    end

    it 'should convert a three-level tree into a vector' do
      tree = Tree.new
      tree.insert(1)
      tree.insert(2)
      tree.insert(3)

      parent_node = tree.root.children.first
      parent_node.insert(4)
      parent_node.insert(5)

      grandparent_node = parent_node.children.first
      grandparent_node.insert(6)
      grandparent_node.insert(7)

      expect(tree.to_vector).to eq([1,2,3,4,5,6,7])
    end
  end

  describe '#from_vector' do
    it 'should initialize a tree from the vector' do
      vector = [1,2,3]
      tree = Tree.from_vector(vector)

      expect(tree.to_vector).to eq(vector)
    end

    it 'should initialize a tree with a depth of 3 from a vector' do
      vector = [1,2,3,4,5,6,7]
      tree = Tree.from_vector(vector)

      expect(tree.depth).to eq(3)
      expect(tree.to_vector).to eq(vector)
    end
  end
end

