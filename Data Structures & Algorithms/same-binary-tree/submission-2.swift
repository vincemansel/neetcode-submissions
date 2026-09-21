/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var queue = [(TreeNode?, TreeNode?)]()
        queue.append((p,q))

        while !queue.isEmpty {
            var count = queue.count
            while count > 0 {
                let (p1,q1) = queue.removeFirst()
                count -= 1
                if p1 == nil && q1 == nil {
                    continue
                }
                else if p1 == nil && q1 != nil {
                    return false
                }
                else if p1 != nil && q1 == nil {
                    return false
                }
                else if p1!.val != q1!.val {
                    return false
                }
                queue.append((p1!.left,q1!.left))
                queue.append((p1!.right,q1!.right))
            }
        }

        return true
    }
}
