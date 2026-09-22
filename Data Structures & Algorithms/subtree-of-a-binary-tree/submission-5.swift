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
        if subRoot == nil { return true }
        else if root == nil { return false }

        if sameTree(root,subRoot) {
            return true
        }
        return isSubtree(root?.left,subRoot) ||
               isSubtree(root?.right,subRoot)
    }

    func sameTree(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil { return true }

        if let node1 = node1, let node2 = node2, node1.val == node2.val {
            return sameTree(node1.left, node2.left) &&
                   sameTree(node1.right, node2.right)
        }
        else {
            return false
        }
    }
}
