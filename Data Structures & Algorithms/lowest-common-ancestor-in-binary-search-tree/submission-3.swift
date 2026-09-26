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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        func lca(_ node: TreeNode?) -> TreeNode? {
            guard let node = node else { return nil }

            if p!.val < node.val && q!.val < node.val {
                return lca(node.left)
            }
            else if p!.val > node.val && q!.val > node.val {
                return lca(node.right)
            }
            return node
        }
        return lca(root)
    }
}
