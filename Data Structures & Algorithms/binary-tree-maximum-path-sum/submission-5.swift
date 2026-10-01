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

// [Hint][state] using root not node inside dfs function
// - Incorrect
/*
        func dfs(_ node: TreeNode?) -> Int {
        // ... snip
            let leftMax = max(dfs(root.left), 0)
            let rightMax = max(dfs(root.right), 0)
*/
// [Hint][return] incorrect variable name used, left instead of leftMax
class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = root!.val

        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            let leftMax = max(dfs(node.left), 0)
            let rightMax = max(dfs(node.right), 0)

            maxSum = max(maxSum, node.val + leftMax + rightMax)

            return node.val + max(leftMax, rightMax, 0)
        }

        dfs(root)
        return maxSum
    }
}
