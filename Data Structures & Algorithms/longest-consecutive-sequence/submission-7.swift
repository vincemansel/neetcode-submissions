class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let seen = Set(nums)
        var longest = 0

        for num in seen {
            var length = 1
            if !seen.contains(num-1) {
                while seen.contains(num + length) {
                    length += 1
                }
            }
            longest = max(longest, length)
        }

        return longest
    }
}
