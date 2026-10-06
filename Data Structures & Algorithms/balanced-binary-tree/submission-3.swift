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
    var balanced = true
    func isBalanced(_ root: TreeNode?) -> Bool {

        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            let left = dfs(node.left)
            let right = dfs(node.right)

            if abs(left - right) > 1 {
                balanced = false
                return abs(left - right)
            }

            return 1 + max(left,right)
        }
        dfs(root)
        return balanced
    }
}
