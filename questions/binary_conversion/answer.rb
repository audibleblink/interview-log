require 'rspec/autorun'

def to_binary(number)
  resp = []
  until number == 0
    number, rem = number.divmod(2)
    resp.unshift(rem)
  end
  resp
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
