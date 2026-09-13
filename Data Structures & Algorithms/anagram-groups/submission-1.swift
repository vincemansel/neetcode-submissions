class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var results = [String: [String]]()
        
        for s in strs {
            let sortedS = String(s.sorted())
            results[sortedS, default: []].append(s)
        }

        return Array(results.values)
    }
}
