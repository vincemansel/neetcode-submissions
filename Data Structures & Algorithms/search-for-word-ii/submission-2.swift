// [Clean] optimal
// [Issue][time] 3:11 for experiment and study
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

class Solution {
	func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
		let ROWS = board.count
		let COLS = board[0].count
		var visited = Set<[Int]>()
		var res = Set<String>()
		let root = TrieNode()
		
		for word in words {
			root.addWord(word)
		}
		
		func dfs(_ r: Int, _ c: Int, _ node: TrieNode, _ word: String) {
			if r < 0 || c < 0 || r == ROWS || c == COLS
			{ return }
			guard !visited.contains([r,c]) else
			{ return }
			
			let ch = board[r][c]            
			guard let child = node.children[ch] else
			{ return }
			
			visited.insert([r,c])
			let word = word+String(ch)
			if child.endOfWord {
				res.insert(word)
			}
			
			dfs(r+1,c,child,word)
			dfs(r-1,c,child,word)
			dfs(r,c+1,child,word)
			dfs(r,c-1,child,word)

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