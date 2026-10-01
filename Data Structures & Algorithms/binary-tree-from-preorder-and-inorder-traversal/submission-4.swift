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

// [Hint][lang] Compilation Error: for (i,v) in inorder { // for enumerated()
// [Hint][return] Bad callsite: return builder(0,nums.count-1) // inorder.count-1
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inMap = [Int:Int]()
        var preIndex = 0

        func builder(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }

            let rootVal = preorder[preIndex]
            preIndex += 1
            let root = TreeNode(rootVal)
            let index = inMap[rootVal]!
            root.left = builder(left,index-1)
            root.right = builder(index+1, right)
            return root
        }

        for (i,v) in inorder.enumerated() {
            inMap[v] = i
        }
        return builder(0,inorder.count-1)
    }
}
