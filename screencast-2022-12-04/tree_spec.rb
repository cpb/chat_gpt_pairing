class Tree
  attr_accessor :root

  # initialize an empty tree
  def initialize
    @root = nil
  end

  # insert a value into the binary tree
  def insert(value)
    # create a new TreeNode if the root is empty
    if root.nil?
      self.root = TreeNode.new(value)
    else
      root.insert(value)
    end
  end

  # convert the binary tree into a vector
  def to_vector
    return [] if root.nil?

    root.to_vector
  end

  # initialize a tree from a vector
  def self.from_vector(vector)
    tree = Tree.new
    vector.each do |value|
      tree.insert(value)
    end
    tree
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

