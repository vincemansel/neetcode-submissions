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

    /* Dot handling
    b.. - all words starting with b with 2 additional chars
    .ay - all 3 letter words ending with ay
    .a. - all 3 words with "a" as 2nd char

    what happens: b..
        b -> b true
        . -> a true
        . -> y true if d -> false
        endofWord = true

        .ay 
        . -> any starting letter
        a + a -> false
        b + a -> true, continue
        b + a + y true, endOfWord -> true

        .a.
        . -> any starting letter
        a + a -> false
        b + a -> true, continue
        b + a + . any letter -> y -> true, endOfWord

    */
    var candidates = [String]()

    func search(_ word: String) -> Bool {
        searchCandidates(word, 0, root)
    }

    // DFS
    private func searchCandidates(_ word: String, _ index: Int, _ cur: TrieNode) -> Bool {
        var cur = cur
        let word = Array(word)

        for i in index..<word.count {
            let c = word[i]

            if c == "." {
                let nextCandidates = cur.children.keys
                for testChar in nextCandidates {
                    var newWord = word
                    newWord[i] = testChar
                    if searchCandidates(String(newWord), i, cur) {
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
}
