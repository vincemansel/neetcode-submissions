class TrieNode {
    var children = [Character:TrieNode]()
    var endOfWord = false

    func addWord(_ word: String) {
        var cur = self
        for c in word {
            if cur.children[c] == nil {
                cur.children[c] = TrieNode()
            }
            cur = cur.children[c]!
        }
        cur.endOfWord = true
    }
}
// [Hint][lang] r == ROWS, not r = ROWS
// [Hint][lang] visited.contains([r,c]), not visited([r,c])
// [Hint][lang] must unwrap the optional: cur = cur.children[ch]!
// [Hint][lang] must use a var for cur before updating
// [Hint][lang] must convert character (ch) to string: let word = word + String(ch)
// [Hint][approach] MUST initialize the root TrieNode with all input words
// [Issue][lang] Wrong answer: output: ["back"], expected: ["back","backend","cat"]
// [Issue][time] > 20 minutes... (did not start stopwatch)
class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let ROWS = board.count
        let COLS = board[0].count
        var visited = Set<[Int]>()
        //var res = [String]()
        var res = Set<String>()
        let root = TrieNode()

        for word in words {
            root.addWord(word)
        }

        func dfs(_ r: Int, _ c: Int, _ cur: TrieNode, _ word: String) {
            if r < 0 || c < 0 || r == ROWS || c == COLS ||
               visited.contains([r,c]) || cur.children[board[r][c]] == nil {
                return
            }
            let ch = board[r][c]
            let next = cur.children[ch]!

            let word = word + String(ch)
            visited.insert([r,c])

            if next.endOfWord {
                res.insert(word)
            }

            dfs(r+1,c,next,word)
            dfs(r-1,c,next,word)
            dfs(r,c+1,next,word)
            dfs(r,c-1,next,word)

            visited.remove([r,c])
        }

        for i in 0..<ROWS {
            for j in 0..<COLS {
                dfs(i,j,root,"")
            }
        }
        return Array(res)
    }
}
