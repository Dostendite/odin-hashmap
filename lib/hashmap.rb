require "pry-byebug"

# Hashmap implementation
class HashMap
  attr_reader :buckets, :capacity

  def initialize(capacity = 16, load_factor = 0.8)
    @buckets_in_use = 0
    @buckets = Array.new(capacity, nil)
    @capacity = capacity
    @load_factor = load_factor
    @REAL_NUMBER = 0.5 * (Math.sqrt(5) - 1)
  end
  # Check this out later
  # https://www.cs.hmc.edu/~geoff/classes/hmc.cs070.200101/homework10/hashfuncs.html
  # only takes in string type keys

  def to_s
    ret_s = ""

    return "Hashmap is empty" if @buckets.all?(&:nil?)

    @buckets.each_with_index do |node, idx|
      next if node.nil?

      ret_s << "Node {#{idx}} -> #{node}\n"
    end
    ret_s
  end

  def length
    @buckets_in_use
  end

  def clear
    @buckets_in_use = 0
    @buckets.map! { |bucket| bucket = nil }
  end

  def keys
    ret_ary = []

    @buckets.each_with_index do |bucket, idx|
      next if bucket.nil?

      ret_ary << @buckets[idx].key
    end
    ret_ary
  end

  def values
    ret_ary = []

    @buckets.each_with_index do |bucket, idx|
      next if bucket.nil?

      ret_ary << @buckets[idx].value
    end
    ret_ary
  end

  def get_hash_code(key)
    hash_code = 0
    prime_number = 89

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }
    hash_code
  end

  def get_hash_index(hash_code)
    hash_code % @capacity
  end

  def rehash
    @buckets.each_with_index do |bucket, idx|
      next if bucket.nil?

      node = @buckets[idx]

      # empty bucket
      @buckets_in_use += 1
      @buckets[idx] = nil

      # rehash
      set(node.key, node.value)
    end
  end

  def update_capacity
    capacity_limit = (@capacity * @load_factor).floor(1)

    return unless @buckets_in_use > capacity_limit

    @buckets += Array.new(@capacity, nil)
    @capacity *= 2
  end

  def set(key, value)
    @buckets_in_use += 1
    update_capacity
    node_to_insert = Node.new(key, value)

    hash_code = get_hash_code(key)
    hash_index = get_hash_index(hash_code)

    @buckets[hash_index] = node_to_insert
  end

  def get(key)
    hash_code = get_hash_code(key)
    hash_index = get_hash_index(hash_code)

    return nil if @buckets[hash_index].nil?
    return unless key == @buckets[hash_index].key

    @buckets[hash_index].value
  end

  def has?(key)
    hash_code = get_hash_code(key)
    hash_index = get_hash_index(hash_code)

    return false if @buckets[hash_index].nil?

    @buckets[hash_index].key == key
  end

  def remove(key)
    hash_code = get_hash_code(key)
    hash_index = get_hash_index(hash_code)

    return nil if @buckets[hash_index].nil?

    ret_value = @buckets[hash_index].value
    @buckets_in_use -= 1
    @buckets[hash_index] = nil
    ret_value
  end
end