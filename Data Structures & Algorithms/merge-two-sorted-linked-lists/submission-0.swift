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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
		var newHead: ListNode? = ListNode(-1)
		var current = newHead
	
		var list1 = list1
		var list2 = list2
		
		while list1 != nil && list2 != nil {
			if list1!.val <= list2!.val {
				current?.next = list1
				list1 = list1?.next
			}
			else {
				current?.next = list2
				list2 = list2?.next
			} 
			current = current?.next
		}
		
		if list1 == nil {
			current?.next = list2
		}
		
		if list2 == nil {
			current?.next = list1
		}
		
		return newHead?.next
	}
}