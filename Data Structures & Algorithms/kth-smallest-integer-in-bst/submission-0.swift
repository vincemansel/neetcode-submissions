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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack: [TreeNode] = []
        var k = k
        var current = root

        while !stack.isEmpty || current != nil {
            while current != nil {
                stack.append(current!)
                current = current?.left
            }

            current = stack.removeLast()
            k -= 1
            if k == 0 {
                return current!.val
            }

            current = current?.right
        }

        return -1
    }
}
