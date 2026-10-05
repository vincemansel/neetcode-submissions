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

// [Hint][lang] error: class 'Wrapper' has no initializers
class Wrapper: Comparable {
    let node: ListNode

    static func < (lhs: Wrapper, rhs: Wrapper) -> Bool {
        lhs.node.val < rhs.node.val
    }

    static func == (lhs: Wrapper, rhs: Wrapper) -> Bool {
        lhs.node.val == rhs.node.val
    }

    init(node: ListNode) {
        self.node = node
    }
}

class Solution {
    /*
    list of lists
    guard against empty list when building heap
    */
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let dummy = ListNode(0)
        var cur: ListNode? = dummy

        var heap = Heap<Wrapper>()

        for list in lists {
            guard let list = list else { continue }
            heap.insert(Wrapper(node: list))
        }

        while let wrapper = heap.popMin() {
            cur?.next = wrapper.node
            cur = cur?.next
            if let next = wrapper.node.next {
                heap.insert(Wrapper(node: next))
            }
        }

        return dummy.next
    }
}
