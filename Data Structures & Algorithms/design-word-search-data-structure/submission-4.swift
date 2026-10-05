// [Clean] another improvement
class TrieNode {
    var children = [Character:TrieNode]()
    var endOfWord = false
}

class WordDictionary {
    let root = TrieNode()

    func addWord(_ word: String) {
        var cur = root
        for c in word {
            if cur.children[c] == nil {
                cur.children[c] = TrieNode()
            }
            cur = cur.children[c]!
        }
        cur.endOfWord = true
    }

    func search(_ word: String) -> Bool {
        // DFS
        func searchCandidates(_ index: Int, _ cur: TrieNode) -> Bool {
            var cur = cur
            let testWord = Array(word)

            for i in index..<testWord.count {
                let c = testWord[i]

                if c == "." {
                    for child in cur.children.values {
                        if searchCandidates(i+1, child) {
                            return true
                        }
                    }
                }
                guard let next = cur.children[c] else {
                    return false
                }
                cur = next
            }
            return cur.endOfWord
        }

        return searchCandidates(0, root)
    }
}
