// [Hint][lang] Must comma for let usage AND, not && for multi-clause conditional
// - Incorrect        while i < word.count && let node = node.children.keys.contains(word[i]) {
// [Issue][time] - First attempt, learning
// - Pay attention to optional unwraps
// -- cur = cur.children[c]!
// - TrieNode expansion happens in TrieNode created cur characters TrieNode
// - Correct:     var children: [Character:TrieNode] = [:]
// - Incorrect   var children: [Character:[TrieNode]] = [:]

class TrieNode {
    var children: [Character:TrieNode] = [:]
    var end: Bool

    init() {
        self.children = [:]
        self.end = false
    }
}

class PrefixTree {
    var root: TrieNode = TrieNode()

    func insert(_ word: String) {
        let word = Array(word)
        var cur = root

        for c in word {
            if cur.children.keys.contains(c) == false {
                cur.children[c] = TrieNode()
            }
            cur = cur.children[c]!
        }
        cur.end = true
    }

    func search(_ word: String) -> Bool {
        var cur = root
        for c in word {
            guard let next = cur.children[c] else { break }
            cur = next
        }
        return cur.end
    }

    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        for c in prefix {
            guard let next = cur.children[c] else { return false }
            cur = next
        }
        return true
    }
}
