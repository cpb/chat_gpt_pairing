class Tree
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
    traverse(@root, vector)
    vector
  end

  private

  def traverse(node, vector)
    return if node.nil?
    vector << node.value
    traverse(node.left, vector)
    traverse(node.right, vector)
  end
end

class TreeNode
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert(value)
    if value <= @value
      if @left.nil?
        @left = TreeNode.new(value)
      else
        @left.insert(value)
      end
    else
      if @right.nil?
        @right = TreeNode.new(value)
      else
        @right.insert(value)
      end
    end
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
  end
end
