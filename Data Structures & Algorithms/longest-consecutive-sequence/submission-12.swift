
// [Hint][state] Using wrong max comparison: longest = max(longest,num+length)
// [Hint][init] Start solution with var longest = 0, not 1
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var longest = 0
        var numSet = Set(nums)

        for num in nums {
            guard !numSet.contains(num-1) else { continue }
            var length = 1
            while numSet.contains(num+length) {
                length += 1
            }
            longest = max(longest,length)
        }

        return longest
    }
}
