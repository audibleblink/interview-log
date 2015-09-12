require 'rspec/autorun'

class Set

  def initialize
    # Keeping our collection as a Hash allows
    # us to search for whether or not something
    # exists in constant-time: O(1)
    @data = {}
  end

  def push(key)
    return false if @data.key?(key)
    # since we're using keys to store our data,
    # the value doesn't really matter
    @data[key] = true
  end

end


RSpec.describe Set do
  context "#push"do
    let(:set) { Set.new }

    it "allows addition of new content" do
      expect(set.push("foo")).to be true
    end

    it "returns false if content exists in set" do
      set.push("bar")
      expect(set.push("bar")).to be false
    end

  end
end
