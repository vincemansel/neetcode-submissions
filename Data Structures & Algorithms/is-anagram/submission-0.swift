class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        let s = Array(s)
        let t = Array(t)

        var sMap = [Character:Int]()
        var tMap = [Character:Int]()

        for i in 0..<s.count {
            sMap[s[i], default: 0] += 1
            tMap[t[i], default: 0] += 1
        }

        for key in sMap.keys {
            if sMap[key] != tMap[key] {
                return false
            }
        }

        return true
    }
}
