class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var longest = 0

        for num in numSet {
            var length = 0
            if !numSet.contains(num-1) {
                var curr = num
                while numSet.contains(curr) {
                    curr += 1
                    length += 1
                }
                longest = max(longest, length)
            }
        }

        return longest
    }
}
