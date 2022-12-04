class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  def self.from_vector(vector)
    tree = Tree.new
    vector.each do |value|
      tree.insert(value)
    end
    tree
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
    traverse(@root, vector)
    vector
  end

  private

  def traverse(node, vector)
    return if node.nil?
    vector << node.value
    node.children.each do |child|
      traverse(child, vector)
    end
  end
end

class TreeNode
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @children = []
  end

  def insert(value)
    @children << TreeNode.new(value)
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
  end
end

