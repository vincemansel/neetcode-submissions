class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results = Set<[Int]>()
        let nums = nums.sorted()

        for i in 0..<nums.count-2 {
           let current = nums[i]
           var j = i+1
           var k = nums.count - 1

           while j < k {
            let require = nums[j] + nums[k]
            let sum = current + require
            if sum == 0 {
                results.insert([nums[i], nums[j], nums[k]])
                j += 1
            }
            else if sum < 0 {
                j += 1
            }
            else {
                k -= 1
            }
           }
        }

        return Array(results)
    }
}
