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

// [Hint][boundary] - Wrong answer. Output: [2,8,4,10,6]
// - Did not reverse the second group
class Solution {
    // fast, slow pointers to find mid point
    // after second = slow?.next
    // first = head
    // remember to set slow?.next = nil
    func reorderList(_ head: ListNode?) {
        var fast = head
        var slow = head

        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next
            slow = slow!.next
        }

        var second = slow!.next
        slow!.next = nil

        var cur = second
        var prev: ListNode?

        while cur != nil {
            let tmp = cur?.next
            cur?.next = prev 
            prev = cur
            cur = tmp
        }

        second = prev
        var first = head
        while second != nil {
            let tmp1 = first!.next
            let tmp2 = second!.next
            first!.next = second
            second!.next = tmp1
            first = tmp1
            second = tmp2
        }
    }
}
