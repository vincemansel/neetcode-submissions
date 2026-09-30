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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var k = k
        var kSmallest = 0      
        func dfs(_ node: TreeNode?) {
            guard let node = node, k > 0 else { return }

            dfs(node.left)
            k -= 1
            if k == 0 {
                kSmallest = node.val
                return
            }
            dfs(node.right)
        }
        dfs(root)
        return kSmallest
    }
}
