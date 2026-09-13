class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [[Int]:[String]]()

        let base = Character("a").asciiValue!
        for s in strs {
            var codex = [Int](repeating: 0, count: 26)
            for c in s {
                let index = Int(c.asciiValue! - base)
                codex[index] += 1
            }
            groups[codex, default: []].append(s)
        }

        return Array(groups.values)
    }
}
