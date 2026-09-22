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
    var inMap = [Int:Int]()
    var preIndex = 0

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (i,v) in inorder.enumerated() {
            inMap[v] = i
        }
        return dfs(preorder, 0, inorder.count - 1)
    }

    private func dfs(_ preorder: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        
        let rootVal = preorder[preIndex]
        preIndex += 1
        let root = TreeNode(rootVal)
        let mid = inMap[rootVal]!

        root.left = dfs(preorder, left, mid - 1)
        root.right = dfs(preorder, mid + 1, right)

        return root
    }
}
