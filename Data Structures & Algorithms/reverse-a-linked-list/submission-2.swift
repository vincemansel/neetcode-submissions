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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current = head
        var prev: ListNode?

        while current != nil {
            let tmp = current!.next
            current!.next = prev
            prev = current
            current = tmp
        }
        return prev
    }
}
