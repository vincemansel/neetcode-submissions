class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s2.count >= s1.count else { return false }

        // create freq map of s1
        // scan s2 with r pointer
        // if s2[r] not in map, reset l pointer to r + 1
        // else if window size equals s1.count return true

        var freq = [Character:Int]()
        var count = [Character:Int]()
        let s1 = Array(s1)
        let s2 = Array(s2)

        var l = 0

        for char in s1 {
            freq[char, default: 0] += 1
        } 

        for r in 0..<s2.count {
            if freq.keys.contains(s2[r]) {
                count[s2[r], default: 0] += 1
                if freq == count {
                    return true
                }
                else if (r - l + 1) >= s1.count {
                    count[s2[l], default: 0] -= 1
                    l += 1
                }
            }
            else {
                count = [Character:Int]()
                l = r + 1
            }
    
        }

        return false

    }
}
