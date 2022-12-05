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
    @root = TreeNode.new(vector.shift)
    traverse_pre_order_insert(@root, vector)
  end

  private

  def traverse_pre_order(node, vector)
    return if node.nil?
    vector << node.value
    traverse_pre_order_insert(node.children, vector)
  end

  def traverse_pre_order_insert(node, vector)
    return if vector.empty?
    node.children << TreeNode.new(vector.shift)
    traverse_pre_order_insert(node.children.last, vector)
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

