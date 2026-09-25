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
    func isBalanced(_ root: TreeNode?) -> Bool {
        var balance = true

        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            let left = dfs(node.left)
            let right = dfs(node.right)

            if abs(left - right) > 1 {
                balance = false
            }

            return 1 + max(left,right)
        }

        dfs(root)

        return balance
    }
}
