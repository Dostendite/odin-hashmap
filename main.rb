require_relative "lib/hashmap"
require_relative "lib/node"

test = HashMap.new

test.set("apple", "red")
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
test.set("lion", "golden")

puts "Printing hashmap"
puts test
puts

puts "Getting all test keys"
p test.keys
puts

puts "Getting all test values"
p test.values
puts

puts "Getting all test entries"
p test.entries
puts

puts "Overwriting node 'grape'"
test.set("grape", "red")

puts "Populating with last node to expand the hashmap"
test.set("moon", "silver")
puts

puts "Printing hashmap"
puts test
puts

puts "Overwriting 'jacket', 'ice cream', and 'moon'"
test.set("jacket", "navy")
test.set("ice cream", "chocolate")
test.set("moon", "crimson")
puts

puts "Printing hashmap"
puts test
puts

puts "Getting value 'frog' from the test."
p test.get("frog")
puts

puts "Checking for values 'kite' and 'racecar'."
p test.has?("lion")
p test.has?("racecar")
puts

puts "Removing value 'lion'"
p test.remove("lion")
puts

puts "Printing hashmap"
puts test
puts

puts "Getting length of hashmap"
p test.length
puts

puts "Clearing the hashmap"
p test.clear
puts

puts "Printing hashmap"
puts test
puts