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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()

        func dfs(_ node: TreeNode?, _ level: Int) {
            guard let node = node else { return }

            if result.count == level {
                result.append([])
            }
            result[level].append(node.val)
            dfs(node.left, level+1)
            dfs(node.right, level+1)
        }

        dfs(root, 0)
        return result
    }
}
