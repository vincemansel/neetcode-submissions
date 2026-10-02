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

// [Hint][lang] expected static func < , not merely static <
// [Hint][lang] class Node: Comparable requires an initializer
// - Correct
/*
    init(node: ListNode?) {
        self.node = node
    }
*/
// [Hint][lang] must insert a Node not a ListNode into Heap
// - Correct:
/*
        while let wrapper = heap.popMin() {
            current?.next = wrapper.node
            if let next = wrapper.node.next {
                heap.insert(Node(node: next))
            }
            current = current?.next
        }
*/
// - Incorrect:
/*
        while let wrapper = heap.popMin() {
            current?.next = wrapper.node
            if let next = wrapper.node.next {
                heap.insert(next)
            }
            current = current?.next
        }
*/
class Node: Comparable {
    let node: ListNode
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.node.val < rhs.node.val
    }
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.node.val == rhs.node.val
    }
    init(node: ListNode) {
        self.node = node
    }
}

class Solution {
    // start with list of lists insert into heap
    // that sorts the first k
    // while popMin
    // - attach to current.next
    // - add insert next pointer from what was popped
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap<Node>()
        let dummy = ListNode(0)
        var current: ListNode? = dummy

        for list in lists {
            guard let list = list else { continue }
            heap.insert(Node(node: list))
        }

        while let wrapper = heap.popMin() {
            current?.next = wrapper.node
            if let next = wrapper.node.next {
                heap.insert(Node(node: next))
            }
            current = current?.next
        }

        return dummy.next
    }
}
