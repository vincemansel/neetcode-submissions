class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var sNums = Set(nums)
        var longest = 0

        for num in sNums {
            if !sNums.contains(num - 1) {
                var length = 1
                while sNums.contains(num + length) {
                    length += 1
                }
                longest = max(longest, length)
            }
        }
        return longest
    }
}
