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

// [Hint][state] Assign to groupPrev, not groupNext after reversal

class Solution {
    // groupPrev = dummy
    // kthNode = getKth
    // groupNext = kthNode.next
    // previous = kthNode.next
    // current = groupPrev?.next
    // reverse from kthNode up to groupNext
    // after tmp = groupPrev.next
    // groupPrev.next = previous
    // groupPrev = tmp
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var groupPrev: ListNode? = dummy

        while true {
            guard let kthNode = getKth(groupPrev, k) else {
                break
            }
            let groupNext = kthNode.next
            var previous: ListNode? = kthNode.next
            var current = groupPrev?.next

            while current !== groupNext {
                let tmp = current?.next
                current?.next = previous
                previous = current
                current = tmp
            }

            let tmp = groupPrev?.next
            groupPrev?.next = previous
            groupPrev = tmp
        }
        return dummy.next
    }

    private func getKth(_ cur: ListNode?, _ k: Int) -> ListNode? {
        var cur = cur
        var k = k
        while cur != nil, k > 0 {
            cur = cur!.next
            k -= 1
        }
        return cur
    }
}
