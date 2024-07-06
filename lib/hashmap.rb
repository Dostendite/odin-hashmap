require "pry-byebug"

class HashMap
  attr_reader :buckets, :capacity

  def initialize(capacity = 16, load_factor = 0.8)
    @buckets = Array.new(capacity, nil)
    @capacity = capacity
    @load_factor = load_factor
    @REAL_NUMBER = 0.5 * (Math.sqrt(5) - 1)
  end
  # Check this out later
  # https://www.cs.hmc.edu/~geoff/classes/hmc.cs070.200101/homework10/hashfuncs.html
  # only takes in string type keys

  def to_s
    @buckets.each do |idx, node|
      puts "Node {#{idx}} -> #{node}"
    end
  end

  def hash(key)
    hash_code = 0
    prime_number = 89

    key.each_char { |char| (prime_number * hash_code) + char.ord }
    hash_code
  end

  def rehash
    @buckets.each_with_index do |bucket, idx|
      next if bucket.nil?
      node = @buckets[idx]

      # empty bucket
      bucket = nil

      # rehash
      set(node.key, node.value)
    end
  end

  def update_capacity
    capacity_limit = (@capacity * @load_factor).floor(1)

    return unless @capacity > capacity_limit

    @buckets += Array.new(@capacity, nil)
    @capacity *= 2
  end

  def set(key, value)
    @capacity += 1
    update_capacity
    node_to_insert = Node.new(key, value)
    hash_code = hash(key)
    hash_index = hash_code % @capacity

    @buckets[hash_index] = node_to_insert
  end
end