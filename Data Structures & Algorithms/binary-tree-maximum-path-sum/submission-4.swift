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

// [Issue][boundary] Wrong Answer: 6 / 36 test cases
// - Input: root=[-3]
// - Fix: var maxSum = Int.min (not = 0)

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min

        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            let leftMax = max(dfs(node.left),0)
            let rightMax = max(dfs(node.right),0)

            maxSum = max(maxSum, node.val + leftMax + rightMax)

            return node.val + max(leftMax, rightMax)
        }

        dfs(root)
        return maxSum
    }
}
