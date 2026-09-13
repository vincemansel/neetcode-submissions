class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // t.isEmpty returns ""
        // two maps: countT map and window map
        // have var tracks what is in window
        // need is total chars in countT to cover
        // res is left, right result, resLen tracks current minimum
        // scan s string with r, grow window with char
        // increment have if char in t
        // while have == need, adjust resLen, res accordingly
        // adjust window size with left, increment left pointer
        // return String from array with left and right pointers,
        // or empty string if resLen is still infinite

        guard !t.isEmpty else { return "" }

        let s = Array(s)
        var countT = [Character:Int]()
        var window = [Character:Int]()

        var res = [-1,-1], resLen = Int.max
        var have = 0, l = 0

        for c in t {
            countT[c, default: 0] += 1
        }

        let need = countT.count

        for r in 0..<s.count {
            let c = s[r]
            window[c, default: 0] += 1

            if let count = countT[c], window[c] == count {
                have += 1
            }

            while have == need {
                if (r - l + 1) < resLen {
                    resLen = r - l + 1
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

        let (left, right) = (res[0], res[1])
        return resLen != Int.max ? String(s[left...right]) : ""
    }
}
