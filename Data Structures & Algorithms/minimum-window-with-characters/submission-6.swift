class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !t.isEmpty else { return "" }

        let s = Array(s)
        var countT = [Character:Int]()
        var window = [Character:Int]()
        var res = [-1,-1], resLen = Int.max
        var have = 0, l = 0

        for c in t {
            countT[c,default: 0] += 1
        }
        
        let need = countT.count

        for r in 0..<s.count {
            let c = s[r]
            window[c, default: 0] += 1

            if let count = countT[c], count == window[c] {
                have += 1
            }

            while have == need {
                if (r-l+1) < resLen {
                    resLen = r-l+1
                    res = [l, r]
                }

                let leftChar = s[l]
                window[leftChar, default: 0] -= 1
                
                if let count = countT[leftChar], window[leftChar]! < count  {
                    have -= 1
                }
                l += 1
            }
        }

        let (left, right) = (res[0], res[1])
        return resLen != Int.max ? String(s[left...right]) : ""
    }
}
