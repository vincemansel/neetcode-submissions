class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard !t.isEmpty else { return "" }

        let arr = Array(s)

        var countT = [Character:Int]()
        var window = [Character:Int]()

        var l = 0
        var resLen = Int.max
        var res = [-1,-1]

        for c in t {
            countT[c, default: 0] += 1
        }
        let need = countT.count
        var have = 0

        // scan input string
        for r in 0..<arr.count {
            let c = arr[r]
            // grow window for each char in input
            window[c, default: 0] += 1

            // update have if current char in countT
            if let count = countT[c], window[c] == count {
                have += 1
            }

            // increamentve left pointer until all chars in t are covered 
            while have == need {
                // continue finding minimum window
                if (r - l + 1) < resLen {
                    res = [l, r]
                    resLen = r - l + 1
                }

                let leftChar = arr[l]
                // reduce the window from left
                window[leftChar, default: 0] -= 1

                // reduce the have count for all covered chars in T
                if let count = countT[leftChar], window[leftChar, default: 0] < count {
                    have -= 1
                }
                // increment the left pointer
                l += 1
            }
        }

        let left = res[0], right = res[1]
        return resLen != Int.max ? String(arr[left...right]) : ""
    }
}
