// [TEST][ignore]
class TrieNode {
    var children: [Character: TrieNode]
    var word: Bool

    init() {
        self.children = [:]
        self.word = false
    }
}

class WordDictionary {
    private let root: TrieNode

    init() {
        self.root = TrieNode()
    }

    func addWord(_ word: String) {
        var cur = root
        for c in word {
            if cur.children[c] == nil {
                cur.children[c] = TrieNode()
            }
            cur = cur.children[c]!
        }
        cur.word = true
    }

    func search(_ word: String) -> Bool {
        func dfs(_ j: Int, _ root: TrieNode) -> Bool {
            var cur = root
            let wordArray = Array(word)

            for i in j..<wordArray.count {
                let c = wordArray[i]
                if c == "." {
                    for child in cur.children.values {
                        if dfs(i + 1, child) {
                            return true
                        }
                    }
                    return false
                } else {
                    if cur.children[c] == nil {
                        return false
                    }
                    cur = cur.children[c]!
                }
            }
            return cur.word
        }

        return dfs(0, root)
    }
}