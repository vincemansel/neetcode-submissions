class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var count = [Character:Int]()
        var l = 0, maxf = 0
        var res = 0
        let arr = Array(s)

        for r in 0..<arr.count {
            count[arr[r], default: 0] += 1
            maxf = max(maxf, count[arr[r]]!)

            if (r - l + 1) - maxf > k {
                count[arr[l]]! -= 1
                l += 1
            }

            res = max(res, r-l+1)
        }
        return res
    }

    
}
