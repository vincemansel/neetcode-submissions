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
        func dfs(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }

            let left = dfs(root.left)
            let right = dfs(root.right)

            if left + 2 == right || right + 2 == left {
                balance = false
            }

            return 1 + max(left, right)
        }

        dfs(root)
        return balance
    }
}
