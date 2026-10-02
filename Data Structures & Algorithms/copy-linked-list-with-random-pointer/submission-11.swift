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

// [Hint][lang] optional unwraps required
// - Correct:             
/*
            newNode?.next = mapper[cur!.next]!
            newNode?.random = mapper[cur!.random]!
*/
// - Incorrect:             
/*
            newNode?.next = mapper[cur!.next]
            newNode?.random = mapper[cur!.random]
*/
class Solution {
    // assign a let newNode in 2nd pass to avoid ?! optional unwraps
    func copyRandomList(_ head: Node?) -> Node? {
        var mapper: [Node?:Node?] = [nil:nil]

        var cur = head
        while cur != nil {
            mapper[cur] = Node(cur!.val)
            cur = cur!.next
        }

        cur = head
        while cur != nil {
            let newNode = mapper[cur]!
            newNode?.next = mapper[cur!.next]!
            newNode?.random = mapper[cur!.random]!
            cur = cur!.next
        }

        return mapper[head]!
    }
}
