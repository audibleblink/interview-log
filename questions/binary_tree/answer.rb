require 'rspec/autorun'

Node = Struct.new(:data, :left_node, :right_node) do
  def empty?
    data.nil? && left_node.nil? && right_node.nil?
  end
end


class BTree
  attr_reader :parent_node

  def initialize(parent_node=Node.new)
    @parent_node = parent_node
  end

  def insert(data, node=parent_node)
    return node.data = data if node.empty?

    if data < node.data
      node.left_node ||= Node.new(data)
      insert(data, node.left_node)
    elsif data > node.data
      node.right_node ||= Node.new(data)
      insert(data, node.right_node)
    end
  end

  def find(node_data, node=parent_node)
    return false if node.nil?
    return true  if node.data == node_data

    if node_data < node.data
      find(node_data, node.left_node)
    elsif node_data > node.data
      find(node_data, node.right_node)
    end
  end
end


RSpec.describe BTree do

  let(:tree) {BTree.new}
  let(:sample_data) { [*1..20].shuffle }

  describe "#insert" do

    it "inserts numbers into the tree" do
      sample_data.unshift(1)
      sample_data.each { |num| tree.insert(num) }
      expect(tree.parent_node.data).to eq 1
    end
  end

  describe "#find" do

    before do
      sample_data.each { |num| tree.insert(num) }
    end

    it "returns true for a number in the tree" do
      expect(tree.find(10)).to be true
    end

    it "returns false for a number not in the tree" do
      expect(tree.find(50)).to be false
    end
  end
end
