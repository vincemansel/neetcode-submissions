class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var mapper = [[Int]:[String]]()
        var result = [[String]]()

        let base = Int(Character("a").asciiValue!)

        for s in strs {
            var key = [Int](repeating: 0, count: 26)
            for c in s {
                let index = Int(c.asciiValue!) - base
                key[index] += 1
            }
            mapper[key, default: []].append(s)
        }

        return Array(mapper.values)
    }
}
