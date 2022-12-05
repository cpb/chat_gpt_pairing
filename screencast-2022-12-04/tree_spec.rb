class Tree
  def initialize(root = TreeNode.new)
    @root = root
    @depth = 0
  end

  def to_vector
    vector = []
    traverse_pre_order(@root, vector)
    vector
  end

  def traverse_pre_order(node, vector)
    vector << node.value
    vector << node.children.size
    node.children.each do |child|
      traverse_pre_order(child, vector)
    end
  end

  def depth
    traverse_depth(@root, 0)
  end

  def traverse_depth(node, depth)
    max_depth = depth
    node.children.each do |child|
      child_depth = traverse_depth(child, depth + 1)
      max_depth = [max_depth, child_depth].max
    end
    max_depth
  end

  def self.from_vector(vector)
    root = TreeNode.new(vector.shift)
    traverse_pre_order_build(root, vector)
    Tree.new(root)
  end

  def self.traverse_pre_order_build(node, vector)
    num_children = vector.shift
    num_children.times do
      child = TreeNode.new(vector.shift)
      node.add_child(child)
      traverse_pre_order_build(child, vector)
    end
  end
end

class TreeNode
  attr_accessor :value, :children

  def initialize(value)
    @value = value
    @children = []
  end

  def add_child(node)
    @children << node
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

