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

// [Hint][lang] in getKth: must assign var current = current
// [Hint][lang] requires guard let groupNext, not if let ... to use groupNext later...
// [Issue][boundary] Time Limit Exceeded
// getKth returns kth Node (stop point)
// assign let groupNext as kthNode?.next
// assign var prev also as kthNode?.next
// assign current as groupPrev?.next
// Do reversal
// after adjust groupPrev next to kth Node,
//-  as follows (groupPrev = groupNext)
/*
            let tmp = groupPrev?.next
            groupPrev?.next = kthNode
            // Adjust the groupPrev pointer 
            groupPrev = tmp
*/

class Solution {
    // start with dummy
    
    // groupPrev starts at dummy
    // get k nodes from current, return node starts groupNext
    // if end of list, break
    // reverse it
    // adjust pointers
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        func getKth(_ current: ListNode?) -> ListNode? {
            var n = k
            var current = current
            while n != 0 && current != nil {
                current = current?.next
                n -= 1
            }
            return current
        }

        let dummy = ListNode(0)
        dummy.next = head
        var groupPrev:ListNode? = dummy

        while true {
            guard let kthNode = getKth(groupPrev) else {
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
            groupPrev?.next = kthNode
            groupPrev = tmp
        }

        return dummy.next
    }
}
