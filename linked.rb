class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        node = Node.new value
        if @head.nil? 
            @head = node
            @tail = node
        else
            @tail.next_node = node
            @tail = node
        end
    end

    def prepend(value)
        @head = Node.new value, @head
    end

    def size
        n = 0
        temp = @head
        until temp.nil?
            temp = temp.next_node
            n += 1
        end
        n
    end

    def at(index)
        begin
            node = @head
            0.upto(index - 1) do |ind|
                node = node.next_node
            end
            node
        rescue => exception
            p 'invalid number bruh'
        end
    end

    def pop
        n = size
        if n == 0
            puts "Can't do it my g"
        elsif n == 1 
            @head = nil
            @tail = nil
        else
            at(n - 2).next_node = nil
            @tail = at(n - 2)
        end
    end
    
    def contains?(value)
        if find(value) == nil
            false
        else
            true
        end
    end
    
    def find(value)
        n = 0
        node = @head
        until node.nil?
            if node.value == value
                return n
            else
                node = node.next_node
                n += 1
            end
        end
        return nil
    end

    def to_s
        node = @head
        until node.nil?
            print "( #{node.value} ) -> "
            node = node.next_node
        end
        print "nil"
    end

    def insert_at(index, value)
        if index < 0 || index > size
            p 'really bruh?'
            return
        elsif index == 0
            prepend(value)
        else
            node = Node.new value
            node.next_node = at(index)
            at(index - 1).next_node = node
        end
    end

    def remove_at(index)
        if index < 0 || index > size
            p 'really bruh?'
            return
        elsif index == 0
            @head = nil
            @tail = nil
        else
            at(index - 1).next_node = at(index).next_node
        end
    end
end

list = LinkedList.new
list.append('First')
list.append('Second')
list.append(7)
list.prepend('Third')
list.insert_at(4,'Fourth')
list.remove_at(2)

list.to_s