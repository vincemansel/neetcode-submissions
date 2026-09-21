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
    func goodNodes(_ root: TreeNode?) -> Int {
        var goodNodes = 0

        func dfs(_ node: TreeNode?, _ maxVal: Int) {
            guard let node = node else { return }

            var maxVal = max(maxVal, node.val)
            if maxVal <= node.val {
                goodNodes += 1
            }

            dfs(node.left, maxVal)
            dfs(node.right, maxVal)
        }

        dfs(root, -100)
        return goodNodes
    }
}
