class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var smap = [Character:Int]()
        var tmap = [Character:Int]()
        for c in s {
            smap[c, default: 0] += 1
        }
        for c in t {
            tmap[c, default: 0] += 1
        }
        return smap == tmap
    }
}
