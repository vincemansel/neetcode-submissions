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

// [Hint][lang] Minor issues with Optionals (experimenting)
// [Hint][boundary] Must decrement k in getKth
class Solution {
    /*
    groupPrev = dummy
    kthNode = getKth(gP)
    groupNext = kthNode.next
    prev also
    cur = gp.next
    // reverse
    
    // after revers
    tmp = gP.next
    gP.next = prev 
    gp = tmp
    */
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0,head)
        var groupPrev: ListNode? = dummy

        while true {
            guard let kthNode = getKth(groupPrev, k) else {
                break
            }
            let groupNext = kthNode.next
            var previous = kthNode.next
            var cur = groupPrev?.next

            while cur !== groupNext {
                let tmp = cur?.next
                cur?.next = previous 
                previous = cur
                cur = tmp
            }

            let tmp = groupPrev?.next
            groupPrev?.next = previous
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
