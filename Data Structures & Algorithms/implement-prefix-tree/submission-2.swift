// [Hint][state] - check cur.chidren[c] not cur[c]
// [Hint][lang] - cant force unwrap a non-optional
// [Hint][lang] - typo, copy paste, need prefix not word usage in func startsWith
class TrieNode {
    var children: [Character:TrieNode]
    var endOfWord: Bool
    init() {
        self.children = [:]
        self.endOfWord = false
    }
}

class PrefixTree {
    let head = TrieNode()

    func insert(_ word: String) {
        var cur = head
        for c in word {
            if cur.children[c] == nil {
                cur.children[c] = TrieNode()
            }
            cur = cur.children[c]!
        }
        cur.endOfWord = true
    }

    func search(_ word: String) -> Bool {
        var cur = head
        for c in word {
            guard let next = cur.children[c] else {
                return false
            }
            cur = next
        }
        return cur.endOfWord
    }

    func startsWith(_ prefix: String) -> Bool {
        var cur = head
        for c in prefix {
            guard let next = cur.children[c] else {
                return false
            }
            cur = next
        }
        return true
    }
}
