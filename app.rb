class LinkedList
    def initialize
        @node_list = []
    end

    def append(value)
        new_node = Node.new(value)
        if @node_list.length != 0
            @node_list.last.next_node = new_node
            @node_list.push(new_node)
        else
            @node_list.push(new_node)
        end
    end

    def prepend(value)
            new_node = Node.new(value)
        if @node_list.length != 0
            new_node.next_node = @node_list.first
            @node_list.unshift(new_node)
        else
            @node_list.push(new_node)
        end
    end

    def size
        @node_list.length
    end

    def head
        @node_list.first
    end

    def tail
        @node_list.last
    end

    def at(index)
        @node_list[index]
    end

    def pop
        @node_list.pop
        @node_list.last.next_node = nil
    end

    def contains?(value)
        @node_list.any? { |node| node.value == value }
    end

    def find(value)
        @node_list.each_with_index do |node, index|
            return index if node.value == value
        end
        nil
    end

    def to_s
        @node_list.each do |node|
            print "( #{node.value} ) -> "
        end
        puts 'nil'
    end

    def insert_at(value, index)
        new_node = Node.new(value)
        begin
            @node_list[index - 1].next_node = new_node
            new_node.next_node = @node_list[index + 1]

            @node_list.insert(index, new_node)
        rescue
            p 'Index is invalid'
        end
    end

    def remove_at(index)
        begin
            @node_list[index - 1].next_node = @node_list[index + 1]
            @node_list.delete_at(index)
        rescue
            p 'Index is invalid'
        end
    end

end

class Node
    attr_accessor :next_node, :value

    def initialize(value=nil)
        @value = value
        @next_node = nil
    end
end
