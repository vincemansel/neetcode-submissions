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

            let left = dfs(node.left)
            let right = dfs(node.right)

            let maxLeft = max(0,left)
            let maxRight = max(0,right)
            
            maxSum = max(maxSum, node.val+maxLeft+maxRight)

            return node.val + max(left,right,0)
        }

        let curSum = dfs(root)
        return max(maxSum, curSum)
    }
}
