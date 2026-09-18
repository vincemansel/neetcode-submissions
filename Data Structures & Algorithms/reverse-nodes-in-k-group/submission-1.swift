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

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0)
        var groupPrev = dummy

        var groupStart: ListNode? = head
        var prev: ListNode? = nil

        while groupStart != nil {
            // count off k nodes
            var n = k
            let groupHead = groupStart
            var groupNext = groupStart

            while n > 0 {
                if groupNext == nil {
                    // fewer than k nodes remain; leave this run as-is
                    groupPrev.next = groupHead
                    groupNext = nil
                    break
                }
                groupNext = groupNext?.next
                n -= 1
            }

            if n > 0 { break } // ran out of nodes before completing a group

            groupStart = groupNext

            // reverse k nodes from groupHead up to (not including) groupNext
            var curr = groupHead
            while curr !== groupNext {
                let tmp = curr?.next
                curr?.next = prev
                prev = curr
                curr = tmp
            }

            groupPrev.next = prev
            groupPrev = groupHead!
            prev = nil
        }

        return dummy.next
    }
}