class HashMap
  def initialize(capacity=nil, load_factor=nil)
    @capacity = capacity
    @load_factor = load_factor
    @REAL_NUMBER = 0.5*(Math.sqrt(5)-1)
  end
end