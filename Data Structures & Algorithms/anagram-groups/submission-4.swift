class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [[Int]:[String]]()
        var codex = [Int](repeating: 0, count: 26)

        let base = Character("a").asciiValue!
        for s in strs {
            for c in s {
                let index = Int(c.asciiValue! - base)
                codex[index] += 1
            }
            groups[codex, default: []].append(s)
            codex = [Int](repeating: 0, count: 26)
        }

        return Array(groups.values)
    }
}
