class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        // scan s
        // count map of each char in window
        // sliding window
        // window size - maxf > k is signal to increment left pointer

        let s = Array(s)
        var maxf = 0 // longest so far
        var l = 0
        var res = 0

        var count = [Character:Int]()

        for r in 0..<s.count {
            count[s[r], default: 0] += 1
            maxf = max(maxf, count[s[r]]!)

            if (r - l + 1) - maxf > k {
                count[s[l], default: 0] -= 1
                l += 1
            }

            res = max(res, r - l + 1)
        }

        return res
    }
}
