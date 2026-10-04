// [Clean]
class TrieNode {
    var children: [Character:TrieNode] = [:]
    var endOfWord: Bool = false
}

class PrefixTree {
    let root = TrieNode()

    func insert(_ word: String) {
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
        var cur = root
        for c in word {
            guard let next = cur.children[c] else {
                return false
            }
            cur = next
        }
        return cur.endOfWord
    }

    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        for c in prefix {
            guard let next = cur.children[c] else {
                return false
            }
            cur = next
        }
        return true
    }
}
