/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var cache: [Node?:Node?] = [nil:nil]

        var current = head

        while current != nil {
            let tmp: Node? = Node(current!.val)
            cache[current] = tmp
            current = current?.next
        }

        current = head

        while current != nil {
            let newHead = cache[current]!
            newHead?.random = cache[current?.random]!
            newHead?.next = cache[current?.next]!
            current = current?.next
        }

        return cache[head]!
    }
}
