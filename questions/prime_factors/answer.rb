require 'rspec/autorun'
require 'prime'

def prime_factors(input, answer = [])
  return answer if input == 1

  # find the first prime factor
  return answer unless prime_factor = (2..Math.sqrt(input)).find do |el|
    (input % el).zero? && el.prime?
  end

  answer.push(prime_factor)
  inverse_factor = input / prime_factor
  answer.push(inverse_factor) if inverse_factor.prime?

  prime_factors(inverse_factor, answer)
end




RSpec.describe "#string_reverse" do
  it "should find prime_factors for 25" do
    expect(prime_factors(25)).to eq [5,5]
  end

  it "should find prime_factors for 26" do
    expect(prime_factors(26)).to eq [2,13]
  end

  it "should find prime_factors for 12" do
    expect(prime_factors(12)).to eq [2,2,3]
  end

  it "should find prime_factors for 12" do
    expect(prime_factors(123123123)).to eq [3, 3, 41, 333667]
  end

end
