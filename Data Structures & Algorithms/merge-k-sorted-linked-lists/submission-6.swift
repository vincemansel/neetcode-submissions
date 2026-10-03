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

class Node: Comparable {
    let node: ListNode?

    init(node: ListNode?) {
        self.node = node
    }

    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.node!.val < rhs.node!.val
    }

    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.node!.val < rhs.node!.val
    }
}

// [Hint][lang] dummy is a let (not a var)
// [Hint][state] Remember before heap insertion:
// -            guard let list = list else { continue }

class Solution {
    // start with list of lists into heap
    // parse heap in while loop heap with popMin
    // insert next until heap is exhausted
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap<Node>()
        let dummy = ListNode(0)
        var cur: ListNode? = dummy

        for list in lists {
            guard let list = list else { continue }
            heap.insert(Node(node: list))
        }

        while let wrapper = heap.popMin() {
            cur?.next = wrapper.node
            cur = cur?.next

            if let next = wrapper.node?.next {
                heap.insert(Node(node: next))
            }
        }

        return dummy.next
    }
}
