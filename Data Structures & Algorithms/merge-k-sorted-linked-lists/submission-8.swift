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

// [Hint][lang] Class Node must have an initializer
// - // init(node: ListNode?)
// [Hint][lang] Must be an optional:
// - if let next = wrapper.node?.next
// [Hint][lang] Must insert a Node, not a ListNode
// - Correct: heap.insert(Node(node: next))
// - Incorrect: heap.insert(next)
// [Issue][boundary] - Runtime Error (NZEC)
// - forgot to check for empty to list before insert into heap
// - required:
/*
        for list in lists {
            guard let list = list else { continue }
            heap.insert(Node(node: list))
        }
*/
class Node: Comparable {
    let node: ListNode?

    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.node!.val < rhs.node!.val
    }

    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.node!.val == rhs.node!.val
    }

    init(node: ListNode?) {
        self.node = node
    }
}

class Solution {
    /*
    list of lists in a heap
    while heap.popMin to exhuast
    add another node from list if next not nil
    */
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let dummy = ListNode(0)
        var cur: ListNode? = dummy
        var heap = Heap<Node>()

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
