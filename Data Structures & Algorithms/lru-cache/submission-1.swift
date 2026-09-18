class Node {
    var key: Int
    var val: Int
    var next: Node?
    var prev: Node?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    private var cache: [Int: Node] = [:]
    private let capacity: Int
    private var left: Node
    private var right: Node

    init(_ capacity: Int) {
        self.capacity = capacity
        self.left = Node(0,0)
        self.right = Node(0,0)
        self.left.next = self.right
        self.right.prev = self.left
    }

    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            remove(node)
            insert(node)
            return node.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            remove(node)
        }
        let newNode = Node(key, value)
        cache[key] = newNode
        insert(newNode)

        if cache.count > capacity {
            if let removeNode = left.next {
                remove(removeNode)
                cache[removeNode.key] = nil
            }
        }
    }

    private func remove(_ node: Node?) {
        let prev = node?.prev
        let next = node?.next
        prev?.next = next
        next?.prev = prev
    }

    private func insert(_ node: Node?) {
        let prev = right.prev
        let next = right
        prev?.next = node
        next.prev = node
        node?.prev = prev
        node?.next = next
    }
}
