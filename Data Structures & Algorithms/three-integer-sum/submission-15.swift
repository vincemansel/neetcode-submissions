// [Hint][boundary] Wrong answer
// - output: [[0,1,1]], expected: [[-1,-1,2],[-1,0,1]]
// Using wrong comparison:
// - Correct: compare to sum not nums[i]
// - Incorrect:
/*
                if nums[i] < 0 {
                    j += 1
                }
                else if nums[i] > 0 {
                    k -= 1
                } ... etc..
*/
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let nums = nums.sorted()

        for i in 0..<nums.count-2 {
            let a = nums[i]
            if a > 0 { break }
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var j = i+1
            var k = nums.count - 1
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]

                if sum < 0 {
                    j += 1
                }
                else if sum > 0 {
                    k -= 1
                }
                else {
                    res.append([nums[i], nums[j], nums[k]])
                    j += 1
                    k -= 1
                    while j < k && nums[j] == nums[j-1] {
                        j += 1
                    }
                }
            }
        }
        return res
    }
}
