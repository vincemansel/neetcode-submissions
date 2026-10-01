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
    // Find nth node by running pointer n times
    // 2nd pointer start at dummy lags and will point to node just before removeNode when fast pointer reaches end
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var fast = head
        var i = n

        while i != 0 && fast != nil {
            fast = fast?.next
            i -= 1
        }

        let dummy = ListNode(0)
        dummy.next = head
        var current: ListNode? = dummy

        while fast != nil {
            fast = fast?.next
            current = current?.next
        }

        let next = current?.next?.next
        current?.next = next

        return dummy.next
    }
}
