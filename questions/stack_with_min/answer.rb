require 'rspec/autorun'

class MinStack
  def initialize
    @stack     = []
    @minimum   = []
  end

  def min
    @minimum.last
  end

  def push(item)
    last = min || item
    if item <= last
      @minimum << item
    elsif item > last
      @minimum << last
    end
    stack << item
  end

  def pop
    @minimum.pop
    stack.pop
  end

  private
    attr_accessor :stack

end


RSpec.describe MinStack do
  let(:stack) { MinStack.new }

  context "#min" do
    it "returns the minimun value in the stack" do
      stack.push(10)
      stack.push(1)
      stack.push(100)

      expect(stack.min).to eq 1
    end

    it "returns the minimun value in the stack throughout pops" do
      stack.push(10)
      stack.push(2)
      stack.push(100)
      expect(stack.min).to eq 2

      stack.push(1)
      expect(stack.min).to eq 1

      stack.pop
      expect(stack.min).to eq 2
    end
  end
end
