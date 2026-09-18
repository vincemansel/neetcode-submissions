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
        let dummy = ListNode(0, head)
        var groupPrev: ListNode? = dummy

        while true {
            guard let kth = getKth(groupPrev, k) else {
                break
            }
            let groupNext = kth.next

            var prev: ListNode? = kth.next
            var curr = groupPrev?.next

            while curr !== groupNext {
                let tmp = curr?.next
                curr?.next = prev
                prev = curr
                curr = tmp
            }

            let tmp = groupPrev?.next
            groupPrev?.next = kth
            groupPrev = tmp
        }
        return dummy.next
    }

    private func getKth(_ curr: ListNode?, _ k: Int) -> ListNode? {
        var curr = curr
        var k = k
        while curr != nil && k > 0 {
            curr = curr?.next
            k -= 1
        }
        return curr
    }
}