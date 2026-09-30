// [Hint][lang] typo, forgot the "let right:" in private let right DLLNode
// [Hint][lang] created DLLNode as struct (can not have recursive stored property), must be a class
// [Hint][lang] class DLLNode, no initializer
// [Hint][lang] Used Node (not DLLNode) in insert and remove function signatures
// [Hint][return] Wrong answer. Return node.key, must be node.val

class DLLNode {
    let key: Int
    let val: Int
    var next: DLLNode?
    var prev: DLLNode?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    private let capacity: Int
    private var cache = [Int:DLLNode]()
    private let left: DLLNode
    private let right: DLLNode

    init(_ capacity: Int) {
        self.capacity = capacity
        self.left = DLLNode(0,0)
        self.right = DLLNode(0,0)
        self.left.next = right
        self.right.prev = left
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
        cache[key] = DLLNode(key,value)
        insert(cache[key]!)

        if cache.count > capacity {
            if let removeNode = right.prev {
                remove(removeNode)
                cache[removeNode.key] = nil
            }
        }
    }

    private func insert(_ node: DLLNode) {
        let next = left.next
        let prev = left
        left.next = node
        node.prev = prev
        node.next = next
        next!.prev = node
    }

    private func remove(_ node: DLLNode) {
        let next = node.next
        let prev = node.prev
        prev!.next = next
        next!.prev = prev
    }
}
