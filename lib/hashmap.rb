class HashMap
  def initialize(capacity=16, load_factor=0.8)
    @capacity = capacity
    @load_factor = load_factor
    @REAL_NUMBER = 0.5*(Math.sqrt(5)-1)
  end
  # Check this out later
  # https://www.cs.hmc.edu/~geoff/classes/hmc.cs070.200101/homework10/hashfuncs.html
  
  # only takes in string type keys
  def hash(key)
    hash_code = 0
    prime_number = 89

    key.each_char { |char| prime_number * hash_code + char.ord }
    
    hash_code
  end

  def update_capacity
    capacity_limit = (@capacity * @load_factor).floor(1)

    if @capacity > capacity_limit
      capacity += 8
    end
  end
end