# Find out how to access files with and without code blocks.
# What is the benefit of the code block?

file = File.open('test.txt', 'w+')
file.puts('Whale hello there friend!')
file.close

#http://benjamintan.io/blog/2015/03/28/ruby-block-patterns-and-how-to-implement-file-open/
# above, if you forget file.close then the file remains open until the process ends
# in a code block, the end of the block signals the closing of the file, which leads
# to fewer bugs and a happier developer expierence.
File.open('test2.txt', 'w+') do |f|
  f << "Orange ya glad I didn't say banana?!"
end


# ================================ #
# How would you translate a hash into an array? An array into a hash?

# Array to Hash https://stackoverflow.com/questions/4028329/array-to-hash-ruby
a = [1,2,3,4,5,6]
puts Hash[a.each_slice(2).to_a]
# => {1=>2, 3=>4, 5=>6}
puts Hash[*a]

a3 = [[1,2],[3,4],[5,6]]
h3 = a3.to_h
puts h3
# => {1=>2, 3=>4, 5=>6}

# Hash to Array
h2 = { 'a' => 'apple', 'b' => 'banana', 'c' => 'cranberry'}
h2.to_a
#  => [["a", "apple"], ["b", "banana"], ["c", "cranberry"]]
h2.to_a.flatten
# => ["a", "apple", "b", "banana", "c", "cranberry"]




# ================================ #
# Can you iterate throuh a hash?

# Yes, via keys (.each_key), values(.each_value), or keys & values (.each or .each_pair)
# https://teamtreehouse.com/library/ruby-loops/ruby-iteration/hash-iteration

business = { 'name' => 'Catotopia', 'location' => 'Oakland'}
business.each do |key, value|
  puts "key is #{key}"
  puts "value is #{value}"
end

business.each_key do |key|
  puts "KEYS ONLY #{key}"
end

business.each_value do |value|
  puts "values forever #{value}!"
end




# ================================ #
#You can use Ruby arrays as stacks. What cother common data structures do arrays suport?
# matrix, bag or set (there is a native class for set), queue (LIFO), list (FIFO)
puts "====QUEUE"
deque = [].push('1').push('2')
deque.unshift('no').unshift('yes')
p deque

puts "====LIST"
list = [1,2,3].insert(2,"c")
p list
