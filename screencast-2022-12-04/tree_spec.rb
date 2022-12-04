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
    queue = [@root]
    until queue.empty?
      node = queue.shift
      vector << node.value
      node.children.each do |child|
        queue << child
      end
    end
    vector
  end

  def depth
    max_depth = [0]
    traverse(@root, 0, max_depth)
    max_depth[0]
  end

  private

  def traverse(node, depth, max_depth)
    return if node.nil?
    max_depth[0] = depth if depth > max_depth[0]
    node.children.each do |child|
      traverse(child, depth + 1, max_depth)
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

    it 'should initialize a tree with a depth of 3 from a vector' do
      vector = [1,2,3,4,5,6,7]
      tree = Tree.from_vector(vector)

      expect(tree.depth).to eq(3)
      expect(tree.to_vector).to eq(vector)
    end
  end
end

