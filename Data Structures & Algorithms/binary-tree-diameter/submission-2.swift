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

// [Clean]
class Solution {
    var maxPath = 0

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {

        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            let leftMax = dfs(node.left)
            let rightMax = dfs(node.right)

            maxPath = max(maxPath, leftMax + rightMax)

            return 1 + max(leftMax, rightMax)
        }

        _ = dfs(root)
        return maxPath
    }
}
