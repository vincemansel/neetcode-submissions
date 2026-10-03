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

// [Hint][lang] Attempting quick declaration short cut
// - Correct:         let dummy = ListNode(0)
// - Incorrect:         let dummy = ListNode(0, head)
class Solution {
    /*
    walk front pointer n times 
    dummy
    dummy.next = head
    back = dummy to lag
    front = fast
    when front becomes nil, back.next is removeNode  
    }
    */
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var front = head
        var n = n
        while front != nil && n > 0 {
            front = front!.next
            n -= 1
        }

        let dummy = ListNode(0)
        dummy.next = head
        var back: ListNode? = dummy

        while front != nil {
            front = front!.next
            back = back!.next
        }

        back?.next = back?.next?.next

        return dummy.next
    }
}
