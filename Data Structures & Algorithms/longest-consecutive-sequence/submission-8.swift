class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var longest = 0

        for num in nums {
            if !numSet.contains(num-1) {
                var length = 1
                while numSet.contains(num+length) {
                    length += 1
                }
                longest = max(longest, length)
            }
        }
        return longest
    }
}
