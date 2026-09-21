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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var q: [TreeNode?] = [root]

        while !q.isEmpty {
            var count = q.count
            var level = [Int]()
            while count > 0 {
                count -= 1
                guard let node = q.removeFirst() else {
                    continue
                }
                level.append(node.val)
                if node.left != nil {
                    q.append(node.left)
                }
                if node.right != nil {
                    q.append(node.right)
                }
            }
            if level.isEmpty { continue }
            result.append(level)
        }
        return result
    }
}
