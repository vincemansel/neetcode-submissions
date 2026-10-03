// [Hint][lang] typo - error: cannot find 'numsSet' in scope
// [Hint][init] Wrong Answer: nums=[] should return 0

class Solution {
    // Set of nums
    // Check if num-1 exists
    // If not, start the check forward
    // Stop when nextNum not in set
    // keep max
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var longest = 0

        for num in nums {
            if !numSet.contains(num-1) {
                var len = 1
                while numSet.contains(num+len) {
                    len += 1
                }
                longest = max(longest,len)
            }
        }
        return longest
    }
}
