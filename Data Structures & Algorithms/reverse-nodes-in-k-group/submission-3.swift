/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var cur = head
        var group = 0

        while cur != nil && group < k {
            cur = cur!.next
            group += 1
        }

        if group == k {
            cur = reverseKGroup(cur, k)

            var tempHead = head
            while group > 0 {
                let tmp = tempHead!.next
                tempHead!.next = cur
                cur = tempHead
                tempHead = tmp
                group -= 1
            }

            return cur
        }

        return head
    }
}