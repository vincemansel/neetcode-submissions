// [Hint][lang] maxf = max(maxf, freq[c]) > |- error: value of optional type 'Int?' must be unwrapped to a value of type 'Int'

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var freq = [Character:Int]()
        var maxf = 0
        var l = 0
        var res = 0

        for r in 0..<s.count {
            let c = s[r]
            freq[c, default: 0] += 1

            maxf = max(maxf, freq[c]!)

            if (r - l + 1) - maxf > k {
                freq[s[l], default: 0] -= 1
                l += 1
            }

            res = max(res, r - l + 1)
        }

        return res
    }
}
