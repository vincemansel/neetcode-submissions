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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = root!.val

        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            var maxLeft = max(dfs(node.left), 0)
            var maxRight = max(dfs(node.right), 0)
            
            maxSum = max(maxSum, node.val+maxLeft+maxRight)

            return node.val + max(maxLeft,maxRight,0)
        }

        dfs(root)
        return maxSum
    }
}
