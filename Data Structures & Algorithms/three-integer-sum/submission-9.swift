class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nums = nums.sorted()

        for i in 0..<nums.count-2 {
            let item = nums[i]
            if item > 0 {
                break
            }
            if i > 0 && item == nums[i-1] {
                continue
            }
            var j = i + 1
            var k = nums.count - 1

            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum == 0 {
                    result.append([nums[i], nums[j], nums[k]])
                    j += 1
                    k -= 1
                    while j < k && nums[j] == nums[j-1] {
                        j += 1
                    }
                }
                else if sum < 0 {
                    j += 1
                }
                else {
                    k -= 1
                }
            }
        }
        return result
    }
}
