class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !t.isEmpty else { return "" }

        let s = Array(s)
        let t = Array(t)

        var countT = [Character:Int]()
        var have = 0
        var res = [-1,-1]
        var resLen = Int.max

        var window = [Character:Int]()

        for char in t {
            countT[char, default: 0] += 1
        }

        let need = countT.count

        var l = 0

        for r in 0..<s.count {
            let c = s[r]
            window[c, default: 0] += 1

            if let count = countT[c], window[c] == count {
                have += 1
            }

            while have == need {
                if r-l+1 < resLen {
                    resLen = r-l+1
                    res = [l, r]
                }

                let leftChar = s[l]
                window[leftChar, default: 0] -= 1

                if let count = countT[leftChar], window[leftChar]! < count {
                    have -= 1
                }

                l += 1
            }
            
        }
        return res != [-1,-1] ? String(s[res[0]...res[1]]) : ""
    }
}
