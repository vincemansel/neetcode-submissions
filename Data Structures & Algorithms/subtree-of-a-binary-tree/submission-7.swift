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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let subRoot = subRoot else { return true }
        guard let root = root else { return false }

        if isSameTree(root, subRoot) {
            return true
        }

        return isSubtree(root.left, subRoot) ||
               isSubtree(root.right, subRoot)
    }

    private func isSameTree(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil { return true }

        if let node1 = node1, let node2 = node2, node1.val == node2.val {
            return isSameTree(node1.left, node2.left) &&
                   isSameTree(node1.right, node2.right)
        }
        else {
            return false
        }
    }
}
