class TrieNode {
	var children: [Character:TrieNode]
	var endOfWord: Bool
	
	init() {
		self.children = [:]
		self.endOfWord = false
	}
}

class PrefixTree {
	var root: TrieNode = TrieNode()
	
	func insert(_ word: String) {
		let word = Array(word)
		var cur = root
		
		for c in word {
			if cur.children[c] == nil {
				cur.children[c] = TrieNode()
			}
			cur = cur.children[c]!
		}
		cur.endOfWord = true
	}
	
	func walk (_ word: String) -> TrieNode? {
		var cur = root
		for c in word {
			guard let next = cur.children[c] else { return nil }
			cur = next
		}
		return cur
	}
	
	func search(_ word: String) -> Bool {
		walk(word)?.endOfWord ?? false
	}
	
	func startsWith(_ prefix: String) -> Bool {
		walk(prefix) != nil
	}
}
