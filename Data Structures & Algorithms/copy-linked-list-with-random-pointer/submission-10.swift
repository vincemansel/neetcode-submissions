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

// [Hint][lang] - Optional Unwraps, current?.val must be unwrapped
// - Incorrect: copyMap[current] = Node(current?.val)
// [Issue][lang] - Optional hell stemming from [Node?:Node?]
// - Correct
/*
        while current != nil {
            let newNode = copyMap[current]!
            newNode?.next = copyMap[current?.next]!
            newNode?.random = copyMap[current?.random]!
            current = current?.next
        }
*/
// - This also works but is awkward syntax:
/*
        while current != nil {
            copyMap[current]?!.next = copyMap[current?.next]!
            copyMap[current]?!.random = copyMap[current?.random]!
            current = current?.next
        }
*/
// - Incorrect
/*
        while current != nil {
            copyMap[current]!.next = copyMap[current?.next]!
            copyMap[current]!.random = copyMap[current?.random]!
            current = current?.next
        }
*/
class Solution {
    // 1st pass: Create a hashMap from old nodes to new nodes
    // 2nd pass: Fill in next and random pointers
    // return new head node from hashMap referencing head
    func copyRandomList(_ head: Node?) -> Node? {
        var copyMap: [Node?:Node?] = [nil:nil]

        var current = head

        while current != nil {
            copyMap[current] = Node(current!.val)
            current = current?.next
        }

        current = head

        while current != nil {
            let newNode = copyMap[current]!
            newNode?.next = copyMap[current?.next]!
            newNode?.random = copyMap[current?.random]!
            current = current?.next
        }

        return copyMap[head] ?? nil
    }
}
