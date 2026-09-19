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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0

        func dfs(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }

            let left = dfs(root.left)
            let right = dfs(root.right)

            result = max(result, right + left)
            return 1 + max(left,right)
        }
        
        _ = dfs(root)
        return result
    }
}
