class Tree
  attr_reader :value, :children

  def initialize(value, children = [])
    @value = value
    @children = children
  end
end

def convert_to_tree(vector)
  tree = nil
  queue = []

  vector.each do |value|
    current = Tree.new(value)

    if queue.empty?
      tree = current
    else
      parent = queue.last
      parent.children << current
    end

    queue << current
  end

  tree
end

describe 'convert_to_tree' do
  let(:tree) { Tree.new(1, [Tree.new(2, [Tree.new(4)]), Tree.new(3)]) }
  let(:vector) { [1, 2, 3, 4] }

  it 'converts a vector into an n-ary tree' do
    expect(convert_to_tree(vector)).to eq(tree)
  end
end
