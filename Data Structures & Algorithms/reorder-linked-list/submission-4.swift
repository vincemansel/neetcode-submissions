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

// [Clean]
class Solution {
    // fast, slow pointers to find mid ListNode
    // reverse to end
    // second = slow.next
    // previous = nil
    // slow.next = nil
    // first = head
    // interleave first and second
    func reorderList(_ head: ListNode?) {
        var fast = head, slow = head
        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next
            slow = slow!.next
        }

        var second = slow!.next
        slow!.next = nil
        var prev: ListNode? = nil
        
        while second != nil {
            let tmp = second?.next
            second?.next = prev
            prev = second
            second = tmp
        }
        
        var first = head
        second = prev

        while second != nil {
            let tmp1 = first?.next
            let tmp2 = second?.next
            first?.next = second
            second?.next = tmp1
            first = tmp1
            second = tmp2
        }
    }
}
