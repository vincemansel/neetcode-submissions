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

class Codec {
    // Encodes a tree to a single string.
    // USING PREORDER: "1,2,N,N,3,4,N,N,5" etc...
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
        var i = 0
        let vals = data.components(separatedBy: ",")
        
        func dfs() -> TreeNode? {
            guard vals[i] != "N" else { 
                i += 1
                return nil
            }
            let node = TreeNode(Int(vals[i])!)
            i += 1
            node.left = dfs()
            node.right = dfs()
            return node
        }

        return dfs()
    }

}
