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
    func reorderList(_ head: ListNode?) {
        // Use slow, fast pointer to divide into 2 halves

        var fast = head?.next
        var slow = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        // Reverse second half using prev

        var second = slow?.next
        var prev: ListNode? = nil
        slow?.next = nil

        while second != nil {
            let tmp = second?.next
            second?.next = prev
            prev = second
            second = tmp
        }

        // Use tmp vars to hold first and second next
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
