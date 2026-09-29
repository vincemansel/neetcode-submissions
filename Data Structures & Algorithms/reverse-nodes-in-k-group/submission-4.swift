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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {

        var dummy = ListNode(0)
        dummy.next = head
        var groupPrev: ListNode? = dummy

        while true {
            guard let kthNode = getKthNode(groupPrev,k) else {
                break
            }

            var groupNext = kthNode.next
            var prev: ListNode? = kthNode.next
            var current = groupPrev?.next

            while current !== groupNext {
                let tmp = current?.next
                current?.next = prev
                prev = current
                current = tmp
            }

            let tmp = groupPrev?.next
            groupPrev?.next = kthNode
            groupPrev = tmp
        }

        return dummy.next
    }

    private func getKthNode(_ current: ListNode?, _ k: Int) -> ListNode? {
        var current = current
        var k = k
        while k > 0 && current != nil {
            current = current?.next
            k -= 1
        }
        return current
    }
}
