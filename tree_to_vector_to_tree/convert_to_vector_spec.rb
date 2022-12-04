class Tree
  attr_reader :value, :children

  def initialize(value, children = [])
    @value = value
    @children = children
  end
end

def convert_to_vector(tree)
  vector = []
  queue = [tree]

  while !queue.empty?
    current = queue.shift
    vector << current.value
    queue += current.children
  end

  vector
end

describe 'convert_to_vector' do
  let(:tree) { Tree.new(1, [Tree.new(2, [Tree.new(4)]), Tree.new(3)]) }
  let(:vector) { [1, 2, 3, 4] }

  it 'converts an n-ary tree into a vector' do
    expect(convert_to_vector(tree)).to eq(vector)
  end
end
