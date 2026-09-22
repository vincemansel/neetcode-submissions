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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var value = 0
        var cur = k
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }

            dfs(node.left)
            cur -= 1
            if cur == 0 {
                value = node.val
                return
            }
            dfs(node.right)
        }

        dfs(root)
        return value
    }
}
