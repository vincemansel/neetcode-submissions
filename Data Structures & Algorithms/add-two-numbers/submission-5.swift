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

// [Hint][lang] Runtime Error (NZEC) <experimenting>
// - Correct:             let v1 = l1?.val ?? 0
// - Incorrect:             let v1 = l1!.val ?? 0

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        var l1 = l1
        var l2 = l2
        let dummy = ListNode(0)
        var current: ListNode? = dummy

        while l1 != nil || l2 != nil || carry != 0 {
            let v1 = l1?.val ?? 0
            let v2 = l2?.val ?? 0
            let sum = v1 + v2 + carry
            let digit = sum % 10
            carry = sum/10

            current?.next = ListNode(digit)
            current = current?.next
            l1 = l1?.next
            l2 = l2?.next
        }

        return dummy.next
    }
}
