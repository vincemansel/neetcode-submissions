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
    func maxDepth(_ root: TreeNode?) -> Int {
        var q: [(TreeNode?, Int)] = [(root, 1)]
        var maxDepth = 0

        while !q.isEmpty {
            let (node, depth) = q.removeFirst()
            guard let node = node else { continue }

            q.append((node.left, depth+1))
            q.append((node.right, depth+1))

            maxDepth = max(maxDepth, depth)
        }
        return maxDepth
    }
}
