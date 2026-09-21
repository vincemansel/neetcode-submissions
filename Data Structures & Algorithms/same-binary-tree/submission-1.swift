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

        func dfs(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
            if node1 == nil && node2 == nil {
                return true
            }
            else if (node1 != nil && node2 == nil) ||
                    (node1 == nil && node2 != nil) {
                return false
            }
            else if node1!.val != node2!.val {
                return false
            }
            let left = dfs(node1!.left, node2!.left)
            let right = dfs(node1!.right, node2!.right)

            return left && right
        }

        return dfs(p, q)
    }
}
