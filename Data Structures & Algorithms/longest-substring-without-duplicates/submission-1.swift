class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var i = 0
        var longest = 0
        var seen = [Character:Int]()
        let arr = Array(s)

        for j in 0..<s.count {
            let cur = arr[j]
            if let x = seen[cur] {
                i = max(x + 1, i)
            }
            seen[cur] = j
            longest = max(longest, j-i+1)
        }
        // j, c = index, i, longest
        // 0, a = 0, 0, 1
        // 1, b = 1, 0, 2
        // 2, b = 2, 2, 2
        // 3, a = 3, 1, 3
        
        return longest
    }
}
