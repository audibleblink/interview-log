require "rspec/autorun"

class MyHash
  attr_accessor :filled, :buckets
  RESIZE_THRESHOLD = 0.4

  def initialize
    # start the hash with an array of 6 empty arrays/bucket
    @buckets = Array.new(6) {Array.new}
    # keep track of filled buckets so we can resize if this
    # begins to approach our threshold
    @filled  = 0.0
  end

  # reading method
  def [](key)

    # ideally, we only have one pair stored in this bucket
    # because any more and we resort to a linear search in
    # that bucket. Having more than one key-value pair in a
    # bucket is know as a hash collision
    pair = buckets[index(key)].find do |inner_key, val|
      inner_key == key
    end
    pair[1]
  end

  # writing method
  def []=(key, value)
    resize! if getting_full?
    self.filled += 1
    add(key, value)
  end

  private

  def add(key, value)
    # convenience method that takes a key and value
    # and adds it to the appropriate bucket
    buckets[index(key)] << [key, value]
  end

  def index(key)
    # the key to the hash. takes data, converts it
    # to a number, then finds which bucket to place
    # it in using modulo
    key.hash % buckets.size
  end

  def getting_full?
    filled / buckets.size > RESIZE_THRESHOLD
  end

  def resize!
    # resizes buckets array so collisions become less likely
    puts "RESIZING!"
    old_data = buckets
    self.buckets = Array.new (buckets.size * 2) {[]}
    self.filled = 0.0
    old_data.each do |bucket|
      bucket.each do |key, value|
        add(key, value)
      end
    end
  end

end


RSpec.describe MyHash do
  let(:hash) {MyHash.new}

  it "reads from a hash" do
    hash.send(:add, :foo, :bar)
    expect(hash[:foo]).to eq :bar
  end

  it "writes to a hash" do
    hash[:hello] = "world"
    expect(hash[:hello]).to eq "world"
  end

end
