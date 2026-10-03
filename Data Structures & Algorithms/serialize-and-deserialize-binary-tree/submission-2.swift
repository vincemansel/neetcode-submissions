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

// [Hint][return] must return a nil value
/*
 50 |             if output[index] == "N" {
 51 |                 index += 1
 52 |                 return
    |                 `- error: non-void function should return a value
 53 |             }
*/
class Codec {
    // dfs serial in preorder
    // Mark nil nodes as "N"
    // Create String from Int val
    // Place in output array and use joined()
    // dfs deserial
    // deserial with an index to create nodes

    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var output = [String]()

        func dfs(_ node: TreeNode?) {
            guard let node = node else {
                output.append("N")
                return
            }
            output.append(String(node.val))
            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)
        return output.joined(separator: ",")
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        var index = 0
        let output = data.components(separatedBy: ",")

        func dfs() -> TreeNode? {
            if output[index] == "N" {
                index += 1
                return nil
            }

            let node = TreeNode(Int(output[index])!)
            index += 1
            node.left = dfs()
            node.right = dfs()
            return node
        }

        return dfs()
    }
}
