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

// [Hint][boundary] Time Limit Exceeded - test case input: head=[2,4,6,8]
// - Did not declare second var with correct input:
// - Correct: (looked at solution)
/*
        var second = slow!.next
        var prev: ListNode? = nil
        slow!.next = nil
*/
// - Incorrect:
/*
        var second = slow
        var prev: ListNode?
*/
class Solution {
    func reorderList(_ head: ListNode?) {
        var fast = head
        var slow = head

        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }

        var second = slow?.next
        slow?.next = nil
        var prev: ListNode?

        while second != nil {
            let tmp = second?.next
            second?.next = prev
            prev = second
            second = tmp
        }

        second = prev
        var first = head

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
