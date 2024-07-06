# Node element containing a key & value pair for a hashmap
class Node
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end

  def to_s
    "#{key} -> #{value}"
  end
end