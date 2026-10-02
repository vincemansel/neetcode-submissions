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

// [Issue][init] Wrong Answer: (look at solution)
// - output: [1,4,3,2,5,6] expected: [3,2,1,6,5,4]
// - groupPrev must start at dummy not dummy.next
class Solution {
    // groupPrev = dummy.next
    //
    // after getKth, and before reversal
    // let groupNext = kthNode.next
    // var prev: ListNode? = kthNode.next
    // current = groupPrev?.next
    //
    // after reversal
    // tmp = groupPrev?.next
    // groupPrev?.next = prev
    // groupPrev = tmp
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var groupPrev: ListNode? = dummy

        while true {
            guard let kthNode = getKth(groupPrev, k) else {
                break
            }

            let groupNext = kthNode.next
            var prev: ListNode? = kthNode.next
            var current = groupPrev?.next

            while current !== groupNext {
                let tmp = current?.next
                current?.next = prev
                prev = current
                current = tmp
            }

            let tmp = groupPrev?.next
            groupPrev?.next = prev
            groupPrev = tmp
        }

        return dummy.next
    }

    private func getKth(_ cur: ListNode?, _ k: Int) -> ListNode? {
        var cur = cur
        var k = k
        while cur != nil && k > 0 {
            cur = cur!.next
            k -= 1
        }
        return cur
    }
}
