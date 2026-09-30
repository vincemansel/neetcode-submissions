// [Hint][lang] Attempting to mutate index i of for loop, should be a while loop, or
// - Correction: (for loop is cleaner, easier maintenance than while for index maintenace)
/*
        for i in 0..<nums.count-2 {
            let item = nums[i]
            if item > 0 {
                break
            }
            if i > 0 && item == nums[i-1] {
                continue
            }
*/
// [Hint][boundary] Time Limit Exceeded: while i < nums.count (need nums.count-1), and need to decrement k (right pointer)
// - Incorrect
/*
                else if sum > 0 {
                    k += 1
                }
*/
// [Hint][boundary] Time Limit Exceeded - after creating outer while loop, did not increment i += 1 at bottom of loop
// [Issue][approach] Wrong Answer: 22 / 35 test cases 
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nums = nums.sorted()

        for i in 0..<nums.count-2 {
            let a = nums[i]
            if a > 0 { break }
            if i > 0 && a == nums[i-1] {
                continue
            }
            var j = i+1
            var k = nums.count-1
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum < 0 {
                    j += 1
                }
                else if sum > 0 {
                    k -= 1
                }
                else {
                    result.append([nums[i], nums[j], nums[k]])
                    j += 1
                    k -= 1
                    while j < k && nums[j] == nums[j-1] {
                        j += 1
                    }
                }
            }
        }

        return result
    }
}
