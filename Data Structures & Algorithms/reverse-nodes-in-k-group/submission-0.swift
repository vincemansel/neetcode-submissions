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
		let dummy = ListNode(0)
		var runner = dummy
		
		var current: ListNode? = head // tracks original
		var prev: ListNode? = nil
		
		while current != nil {
			// count off k nodes
			var n = k
			var first = current
			while current != nil {
				n -= 1
				current = current?.next
				if n == 0 {
					break
				}
				if current == nil && n != 0 {
					// just append first to runner
					runner.next = first
					break
				}
			}
			if current == nil && n != 0 { break }
			let second = current
			let saveFirst = first
			// just reverse k nodes from first to second
			while second != nil && ObjectIdentifier(first!) != ObjectIdentifier(second!) ||
				    second == nil && first != nil {
				let tmp = first?.next
				first?.next = prev
				prev = first
				first = tmp
			}
			
			runner.next = prev
			runner = saveFirst!
			prev = nil
		}
		
		return dummy.next
	}
}