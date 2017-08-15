#Print the contents of an array of 16 #, x4 at a time, just using .each
#Do again with `.eachslice` in `Enumerable`
a = [*(1..16)]

a.each do |num|
  if num % 4 == 0
    puts a[num - 4..num]
    puts '---'
  end
end

a.each_slice(4) { |slice| p slice}





# ================================ #

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    if name.respond_to?('keys') then
      root_node = name.first
      name = root_node[0]
      children = root_node[1]
    end

    if children.respond_to?('keys') then
      children = children.map do |child_name, grandchildren|
        Tree.new(child_name, grandchildren)
      end
    end

    @node_name = name
    @children = children
  end

  def visit_all(&block)
    visit &block
    children.each {|child| child.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end
end

# family_tree = Tree.new( "Victor", [
#   Tree.new("Vicki"),
#   Tree.new("Mark", [
#     Tree.new("Rachel")
#     ])
#   ]
# )

family_tree2 = Tree.new({"Victor" => {
  "Vicki" => {},
  "Mark" => {"Rachel" => {}}
  }
})
p "vising single node"
family_tree2.visit {|node| puts node.node_name}
p
p "visiting all nodes"
family_tree2.visit_all {|node| p node.node_name}



# ================================ #

# Write a simple grep that will print the lines of a file having any occurrences
# of a phrase anywhere in that line. you will need to do a simple regular
# expression match and read lines from a file. (This is surprisingly simple in
# Ruby.) If you want, include line numbers.
# f = File.

def findWord(word, filename)
  regex = Regexp.new(word)
  File.foreach(filename).with_index { |line, line_num|
    p "#{line_num}: #{line}" if regex =~ line
  }
end

findWord('the', './lawrence.txt')
