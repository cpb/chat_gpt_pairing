describe 'convert_to_vector' do
  let(:tree) { Tree.new(1, [Tree.new(2, [Tree.new(4)]), Tree.new(3)]) }
  let(:vector) { [1, 2, 3, 4] }

  it 'converts an n-ary tree into a vector' do
    expect(convert_to_vector(tree)).to eq(vector)
  end
end
