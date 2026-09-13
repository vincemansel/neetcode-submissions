class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var longest = 0
        let arr = Array(s)
        var charSet = Set(arr)

        for c in charSet {
            var count = 0
            var l = 0
            
            for r in 0..<arr.count {
                if arr[r] == c {
                    count += 1
                }

                while (r - l + 1) - count > k {
                    if arr[l] == c {
                        count -= 1
                    }
                    l += 1
                }

                longest = max(longest, r-l+1)
            }
        }

        return longest
    }
}
