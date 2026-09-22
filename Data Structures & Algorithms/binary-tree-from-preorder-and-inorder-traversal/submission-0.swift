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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty && !inorder.isEmpty else {
            return nil
        }
        
        let root = TreeNode(preorder[0])
        guard let mid = inorder.firstIndex(of: preorder[0]) else {
            return root
        }

        root.left = buildTree(
            Array(preorder[1..<(mid+1)]),
            Array(inorder[0..<mid]))

        root.right = buildTree(
            Array(preorder[(mid+1)..<preorder.count]), 
            Array(inorder[(mid+1)..<inorder.count]))

        return root

    }
}
