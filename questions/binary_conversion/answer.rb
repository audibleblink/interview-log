require 'rspec/autorun'

def to_binary(number)

  response = []
  until number == 0
    # divmod return an array of 2 elements
    # the first is the divisor and the second
    # is the remainder (modulo)
    # Ex 11.divmod(2) => [5,1]
    number, remainder = number.divmod(2) # 2 because binary is base 2
    # This reassigns number on every iteration,
    # gradually bringin us closer to 0, which
    # is needed to satisfy our until condition
    response.unshift(remainder)
  end
  response
end


RSpec.describe "#to_binary" do
  it "converts 3 correctly" do
    expect(to_binary(3)).to eq [1,1]
  end

  it "converts 32 correctly" do
    expect(to_binary(32)).to eq [1,0,0,0,0,0]
  end

  it "converts 5 correctly" do
    expect(to_binary(5)).to eq [1,0,1]
  end
end
