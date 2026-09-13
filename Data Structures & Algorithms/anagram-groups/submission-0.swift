class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [Array<Int> : [String]]()

        for s in strs {
            var counts = Array<Int>(repeating: 0, count: 26)

            let base = Int(Character("a").asciiValue!)
            for c in s {
                let index = Int(c.asciiValue!) - base
                counts[index] += 1
            }

            map[counts, default: []].append(s)
        }

        return Array(map.values)
    }
}
