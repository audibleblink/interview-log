require 'rspec/autorun'

# you can call indices on a string

def string_reverse(input)
  length = input.length - 1

  (0..length/2).each do |ind|
    # swaps the values located at nth from the beginning and nth from the
    input[ind], input[length-ind] = input[length-ind], input[ind]
  end

  input
end


RSpec.describe "#string_reverse" do
  it "should reverse a string" do
    expect(string_reverse("racecars")).to eq 'sracecar'
  end

  it "should return the same string" do
    test_string = "this"
    expect(string_reverse(test_string)).to be test_string
  end
end
