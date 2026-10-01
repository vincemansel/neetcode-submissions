// [Issue][boundary] Wrong answer: 2 / 35 test cases
// Input: nums=[0,0,0]. Output [] Expected: [[0,0,0]]
// - Incorrect: if a >= 0 { break }
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nums = nums.sorted()

        for i in 0..<nums.count-2 {
            let a = nums[i]
            if a > 0 { break }
            if i > 0 && nums[i] == nums[i-1] {
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
                    result.append([nums[i],nums[j],nums[k]])
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
