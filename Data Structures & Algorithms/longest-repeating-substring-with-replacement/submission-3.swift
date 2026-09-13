class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        // scan r, updating count map
        // keep track of max window so far for current character
        // when currentWindow - maxf > k. 
        // > adjust count and left

        var count = [Character:Int]()
        var maxF = 0
        var longest = 0
        var l = 0

        let arr = Array(s)
        for r in 0..<arr.count {
            count[arr[r], default: 0] += 1
            maxF = max(maxF, count[arr[r]]!)

            if (r - l + 1) - maxF > k {
                count[arr[l], default: 0] -= 1
                l += 1
            }

            longest = max(longest, r - l + 1)
        }

        return longest
    }
}
