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
    func isValidBST(_ root: TreeNode?) -> Bool {

        func isValid(_ node: TreeNode?, _ lower: Int, _ upper: Int) -> Bool {
            guard let node = node else { return true }

            
            if !(lower < node.val && node.val < upper) {
                return false
            }

            return isValid(node.left, lower, node.val) && isValid(node.right, node.val, upper)
        }

        return isValid(root, Int.min, Int.max)
    }
}
