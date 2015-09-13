require 'rspec/autorun'

def is_palindrome?(number)

  original_number = number
  reversed_number = 0

  while number > 0
    # We're working with base 10 numbers. Modulo comes
    # in handy here. Running modulo 10 gives use our
    # 'ones' place
    last_digit = number % 10

    # Multiply any existing numbers by ten, so we can
    # access the new, empty 'ones' place and add to it
    reversed_number = reversed_number * 10 + last_digit

    # Reassign `number` so it approaches our while
    # condition
    number /= 10
  end

  # Are they the same?
  original_number == reversed_number

end


RSpec.describe "is_palindrome?" do
  it "returns true for a numerical palindrome" do
    expect(is_palindrome?(321123)).to be true
  end

  it "returns false when not a numerical palindrome" do
    expect(is_palindrome?(12345)).to be false
  end
end
