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
    func goodNodes(_ root: TreeNode?) -> Int {
        var goodNodes = 0
        var q = Deque<(TreeNode?, Int)>()
        q.append((root, -100))

        while !q.isEmpty {
            let (node, maxValue) = q.removeFirst()
            guard let node = node else { continue }
            let newMax = max(maxValue, node.val)
            if newMax <= node.val {
                goodNodes += 1
            }
            q.append((node.left, newMax))
            q.append((node.right, newMax))
        }
        return goodNodes
    }
}
