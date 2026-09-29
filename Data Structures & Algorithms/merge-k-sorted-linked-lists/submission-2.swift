/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

struct Node: Comparable {
    let node: ListNode

    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.node.val < rhs.node.val
    }

    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.node.val == rhs.node.val
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap<Node>()

        let result = ListNode(0)
        var current = result
        
        for list in lists {
            if let node = list {
                heap.insert(Node(node: node))
            }
        }

        while let item = heap.popMin() {
            current.next = item.node
            current = current.next!

            if let next = item.node.next {
                heap.insert(Node(node: next))
            }
        }

        return result.next
    }
}
