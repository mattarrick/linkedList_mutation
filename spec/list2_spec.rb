require 'list2'

describe LinkedListNode do
  it "should return false if no loop is found" do
    node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(99, node1)
    node3 = LinkedListNode.new(12, node2)
    expect(infinite_loop?(node3)).to be false
  end

  it "should return true if infinite loop is found" do
    node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(99, node1)
    node3 = LinkedListNode.new(12, node2)
    node1.next_node = node3
    expect(infinite_loop?(node3)).to be true
  end

end