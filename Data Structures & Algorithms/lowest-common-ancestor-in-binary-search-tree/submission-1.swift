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
        var stack: [TreeNode?] = [root]

        while !stack.isEmpty {
            let node = stack.removeLast()
            if p!.val < node!.val && q!.val < node!.val {
                stack.append(node!.left)
            }
            else if p!.val > node!.val && q!.val > node!.val {
                stack.append(node!.right)
            }
            else {
                return node
            }
        }
        return nil
    }
}
