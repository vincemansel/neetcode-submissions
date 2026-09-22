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
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head

        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if ObjectIdentifier(slow!) == ObjectIdentifier(fast!) {
                return true
            }
        }

        return false
    }
}

