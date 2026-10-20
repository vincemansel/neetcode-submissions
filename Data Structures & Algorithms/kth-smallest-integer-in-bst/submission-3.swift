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
    /*
    Walk the tree inorder traversal dfs
    Collect in inorder array
    when count == k, signal found
    */
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var counter = [Int]()
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }

            dfs(node.left)
            counter.append(node.val)
            if counter.count == k {
                return
            }
            dfs(node.right)
        }

        dfs(root)
        return counter[k-1]
    }
}
