class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        // scan string
        // count map of each char in window
        // sliding window
        // window size - maxf > k is signal to increment left pointer
        // res is window size (not maxf)

        let s = Array(s)
        var count = [Character:Int]()
        var l = 0
        var maxf = 0
        var res = 0

        for r in 0..<s.count {
            let c = s[r]
            count[c, default: 0] += 1
            maxf = max(maxf, count[c]!)
            
            if (r - l + 1) - maxf > k {
                count[s[l], default: 0] -= 1
                l += 1
            }

            res = max(res, r - l + 1)
        }

        return res
    }
}
