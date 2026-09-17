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
        var cache: [Node?:Node?] = [:]

        var current = head

        while current != nil {
            let tmp: Node? = Node((current?.val)!)
            tmp?.next = current?.next
            tmp?.random = current?.random
            cache[current] = tmp
            current = current?.next
        }

        current = head
        let dummy = Node(-1)
        var newHead:Node? = dummy

        while current != nil {
            newHead?.next = cache[current]!
            if let randomCopy = cache[current?.random] {
                newHead?.next?.random = randomCopy
            }

            if let nextCopy = cache[current?.next] {
                newHead?.next?.next = nextCopy
            }
            current = current?.next
            newHead = newHead?.next
        }

        return dummy.next

    }
}
