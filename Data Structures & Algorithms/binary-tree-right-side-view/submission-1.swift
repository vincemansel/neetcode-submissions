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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var q: Deque<TreeNode?> = []
        q.append(root)

        var result = [Int]()

        while !q.isEmpty {
            let count = q.count
            var level = [Int]()
            for _ in 0..<count {
                guard let node = q.removeFirst() else {
                    continue
                }
                level.append(node.val)
                if let left = node.left {
                    q.append(left)
                }
                if let right = node.right {
                    q.append(right)
                }
            }
            guard level.count > 0 else { continue }
            result.append(level.removeLast())
        }
        return result
    }
}
