class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list, previous=nil)
  current_head = list.next_node
  list.next_node = previous
  if current_head
    reverse_list(current_head, list)
  else
    list
  end
end

def infinite_loop?(list)
  h = list.next_node
  t = list.next_node

  until h.nil?
    h = h.next_node
    if h.nil?
      return false
    else
      h = h.next_node
      t = t.next_node
      if h == t
        return true
      end
    end
  end
  return false
  # until h.nil?
  #   h = h.next_node
  #   return false if h.nil?

  #   h = h.next_node
  #   t = t.next_node
  #   return true if h == t
  # end

  # return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

puts "Forward List"
print_values(node3)
puts " "

puts "Reverse List"
revlist = reverse_list(node3)
print_values(revlist)
puts " "

puts "Infinite Loop: False"
puts infinite_loop?(node3)
puts " "

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

puts "Infinite Loop: True"
node1.next_node = node3
puts infinite_loop?(node3)
