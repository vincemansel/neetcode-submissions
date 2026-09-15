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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newHead: ListNode?
        var current = head
        var arr = [Int]()

        while current != nil {
            arr.append(current!.val)
            newHead = current
            current = current!.next
        }

        var nextHead = newHead

        for i in stride(from: arr.count-2, through: 0, by: -1) {
            nextHead!.next = ListNode(arr[i])
            nextHead = nextHead!.next
            
        }

        return newHead
    }
}
