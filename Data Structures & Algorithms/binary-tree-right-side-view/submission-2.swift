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
        var q: [TreeNode?] = [root]
        var result: [Int] = []

        while !q.isEmpty {
            var cache: [Int] = []
            for _ in 0..<q.count {
                guard let node = q.removeFirst() else {
                    continue
                }
                cache.append(node.val)
                q.append(node.left)
                q.append(node.right)
            }
            guard let item = cache.last else {
                continue
            }
            result.append(item)
        }
        return result
    }
}
