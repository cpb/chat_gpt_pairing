describe 'convert_to_tree' do
  let(:tree) { Tree.new(1, [Tree.new(2, [Tree.new(4)]), Tree.new(3)]) }
  let(:vector) { [1, 2, 3, 4] }

  it 'converts a vector into an n-ary tree' do
    expect(convert_to_tree(vector)).to eq(tree)
  end
end
