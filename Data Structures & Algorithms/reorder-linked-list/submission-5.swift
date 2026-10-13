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

// [Hint][boundary] Runtime Error
// Bad assignment: slow = fast!.next
class Solution {
    func reorderList(_ head: ListNode?) {
        var fast = head
        var slow = head

        while fast != nil && fast!.next != nil {
            fast = fast!.next!.next
            slow = slow!.next
        }

        var second = slow!.next
        var prev: ListNode? = nil
        slow!.next = nil

        while second != nil {
            let tmp = second!.next
            second!.next = prev
            prev = second
            second = tmp
        }

        var first = head
        second = prev

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
