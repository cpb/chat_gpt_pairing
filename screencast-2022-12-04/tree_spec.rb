class Tree
  attr_accessor :root, :depth

  def initialize(root)
    @root = root
    @depth = 0
  end

  def to_vector
    vector = []
    traverse_pre_order(@root, vector)
    vector
  end

  def from_vector(vector)
    traverse_pre_order(vector, self)
  end

  def depth
    traverse_depth(@root, 0)
  end

  private

  def traverse_pre_order(node, vector)
    vector << node.value
    node.children.each do |child|
      traverse_pre_order(child, vector)
    end
  end

  def traverse_depth(node, depth)
    left_depth = traverse_depth(node.children[0], depth + 1) if node.children[0]
    right_depth = traverse_depth(node.children[1], depth + 1) if node.children[1]
    left_depth ||= 0
    right_depth ||= 0
    @depth = [left_depth, right_depth, depth].max
    @depth
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

