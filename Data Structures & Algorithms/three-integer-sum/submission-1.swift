class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = Set<[Int]>()

        for i in 0..<nums.count-2 {
            var j = i+1
            var k = nums.count - 1

            while j < k {
                let sum = nums[i] + nums[j] + nums[k]

                if sum == 0 {
                    result.insert([nums[i], nums[j], nums[k]])
                    j += 1
                    k -= 1
                }
                else if sum < 0 {
                    j += 1
                }
                else {
                    k -= 1
                }
            }
        }

        return Array(result)
    }
}
