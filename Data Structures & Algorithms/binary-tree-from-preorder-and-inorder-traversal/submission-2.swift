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
    var preIndex = 0
    var inorderMap = [Int:Int]()

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {

        func dfs(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }

            let preVal = preorder[preIndex]
            let node = TreeNode(preVal)
            preIndex += 1
            let mid = inorderMap[preVal]!
            node.left = dfs(left,mid-1)
            node.right = dfs(mid+1,right)
            return node
        }

        for (i,v) in inorder.enumerated() {
            inorderMap[v] = i
        }
        return dfs(0, inorder.count - 1)
    }
}
