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

// [Hint][lang] Must return an optional from getKth
class Solution {
    // groupPrev = dummy
    // before reverse:
    // groupNext = kthNode.next
    // var prev = kthNode.next
    // current = prevGroup.next
    // reverse current up to groupNext
    // after reverse:
    // tmp = groupNext.next
    // groupNext.next = prev
    // groupNext = temp
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0,head)
        var groupPrev: ListNode? = dummy

        while true {
            guard let kthNode = getKth(groupPrev, k) else {
                break
            }

            let groupNext = kthNode.next
            var prev: ListNode? = kthNode.next
            var current: ListNode? = groupPrev?.next

            while current !== groupNext {
                let tmp = current?.next
                current?.next = prev
                prev = current
                current = tmp
            }

            let tmp = groupPrev?.next
            groupPrev?.next = prev
            groupPrev = tmp
        }
        return dummy.next
    }

    private func getKth(_ cur: ListNode?, _ k: Int) -> ListNode? {
        var cur = cur
        var k = k
        while cur != nil && k > 0 {
            cur = cur?.next
            k -= 1
        }
        return cur
    }
}
