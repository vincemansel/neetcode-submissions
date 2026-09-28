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
    var goods = 0
    func goodNodes(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ maxVal: Int) {
            guard let node = node else { return }

            if maxVal <= node.val {
                goods += 1
            }

            let newMax = max(maxVal, node.val)

            dfs(node.left, newMax)
            dfs(node.right, newMax)
        }

        dfs(root, Int.min)
        return goods
    }
}
