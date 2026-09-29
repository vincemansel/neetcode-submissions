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
        var front = head
        var i = 0

        while i < n && front != nil {
            front = front!.next
            i += 1
        }

        let dummy = ListNode(0)
        dummy.next = head
        var back: ListNode? = dummy

        while front != nil {
            front = front?.next
            back = back?.next
        }

        back?.next = back?.next?.next

        return dummy.next
    }
}
