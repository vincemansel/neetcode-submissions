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

struct Item: Comparable {
    let node: ListNode

    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.node.val < rhs.node.val
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.node.val == rhs.node.val
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap<Item>()

        for list in lists {
            if let node = list {
                heap.insert(Item(node: node))
            }
        }

        let result = ListNode(0)
        var current = result

        while let nextItem = heap.popMin() {
            current.next = nextItem.node
            current = current.next!

            if let next = nextItem.node.next {
                heap.insert(Item(node: next))
            }
        }

        return result.next
    }
}
