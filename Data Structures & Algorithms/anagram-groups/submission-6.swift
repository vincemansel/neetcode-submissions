// [Clean]
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // count letters in each string in freq arrays
        // group similar

        var freq = [[Int]:[String]]()

        let base = Int( Character("a").asciiValue! )
        for s in strs {
            var counts = [Int](repeating: 0, count: 26)
            for c in s {
                let index = Int(c.asciiValue!) - base
                counts[index] += 1
            }
            freq[counts, default: []].append(s)
        }

        return Array(freq.values)
    }
}
