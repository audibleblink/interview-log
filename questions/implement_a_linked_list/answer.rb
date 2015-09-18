require 'rspec/autorun'

class Node
  attr_accessor :next_node, :data
  def initialize(next_node=nil, data=nil)
    @next_node = next_node
    @data = data
  end
end

class MyStack

  def initialize
    @node = Node.new
  end

  def push(data)
    new_node = Node.new(@node, data)
    @node = new_node
    @node.data
  end

  def pop
    out   = @node.data
    @node = @node.next_node
    out
  end

end


class MyQueue
  def initialize
    @node = Node.new
  end

  def enqueue(data, node=@node)

    if node.data.nil?
      return node.data = data
    elsif node.next_node.nil?
      node.next_node = Node.new(nil, data)
      return data
    end
    enqueue(data, node.next_node)
  end

  def dequeue
    out = @node.data
    @node = @node.next_node
    out
  end
end



RSpec.describe MyStack do
  let(:stack){MyStack.new}

  it "returns the last item you successfully pushed" do
    stack.push(1); stack.push(2)
    expect(stack.pop).to eq 2
    stack.push(14); stack.push(42)
    expect(stack.pop).to eq 42

  end

end

RSpec.describe MyQueue do
  let(:queue){MyQueue.new}

  it "returns the last item you successfully pushed" do
    queue.enqueue(1)
    queue.enqueue(2)
    expect(queue.dequeue).to eq 1
    queue.enqueue(11)
    queue.enqueue(42)
    expect(queue.dequeue).to eq 2
  end

end
