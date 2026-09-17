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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var count = 0
        var dummy = ListNode(-1)
        dummy.next = head

        var left:ListNode? = dummy
        var right = head

        // count
        while count < n && right != nil {
            count += 1
            right = right?.next
        }

        // shift both
        while right != nil {
            right = right?.next
            left = left?.next
        }
        
        left?.next = left?.next?.next

        return dummy.next
    }
}
