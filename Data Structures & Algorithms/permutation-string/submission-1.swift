class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var freq = [Character:Int]()
        var count = [Character:Int]()
        let s1 = Array(s1)
        let s2 = Array(s2)

        var l = 0

        for c in s1 {
            freq[c, default: 0] += 1
        }

        for r in 0..<s2.count {
            let c = s2[r]
            if freq.keys.contains(c) {
                count[c, default: 0] += 1
                if count == freq {
                    return true
                }
                //else if (r - l + 1) >= s1.count {
                else if let x = count[c], x > freq[c]! {
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
