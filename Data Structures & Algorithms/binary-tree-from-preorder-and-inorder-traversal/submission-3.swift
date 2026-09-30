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

// [Hint][lang] wrong vars, could not find l and r in scope: guard l < r else { return nil }
// [Hint][lang] Need to unwrap the optional: let index = imMap[rootVal], and mispelled inMap (imMap)
// [Hint][boundary] Wrong Answer: [1,null,2,null,3] Correct is [1,2,3,null,null,null,4]
// - Incorrect boundary condition
//             guard left < right else { return nil }
// should be <=

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inMap = [Int:Int]()
        var preIndex = 0

        func builder(_ left: Int, _ right: Int) -> TreeNode? {
            guard left <= right else { return nil }

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
        return builder(0, inorder.count-1)
    }
}
