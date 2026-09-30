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
        var q = Deque<TreeNode?>()
        q.append(root)

        while !q.isEmpty {
            var level = [Int]()
            for _ in 0..<q.count {
                guard let node = q.removeFirst() else { continue }
                level.append(node.val)
                q.append(node.left)
                q.append(node.right)
            }
            guard level.count > 0 else { continue }
            result.append(level)
        }
        return result
    }
}
