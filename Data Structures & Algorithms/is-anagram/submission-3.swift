class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var smap = [Character:Int]()
        for c in s {
            smap[c, default: 0] += 1
        }
        for c in t {
            smap[c, default: 0] -= 1
        }
        for (k,v) in smap {
            if v != 0 { return false}
        }
        return true
    }
}
