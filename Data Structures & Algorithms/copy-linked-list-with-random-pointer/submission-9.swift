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
        var copyMap: [Node?:Node?] = [nil:nil]

        var cur = head

        while cur != nil {
            copyMap[cur] = Node(cur!.val)
            cur = cur?.next
        }

        cur = head

        while cur != nil {
            let tmp = copyMap[cur]!
            tmp?.next = copyMap[cur?.next]!
            tmp?.random = copyMap[cur?.random]!
            cur = cur?.next
        }

        return copyMap[head]!
    }
}
