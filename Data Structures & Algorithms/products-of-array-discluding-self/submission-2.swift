class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: nums.count)
        var prod = 1
        var numberOfZeros = 0

        for num in nums {
            if num == 0 {
                numberOfZeros += 1
            }
            else {
                prod *= num
            }
        }

        if numberOfZeros > 1 {
            return result
        }

        for i in 0..<nums.count {
            if numberOfZeros > 0 {
                result[i] = nums[i] == 0 ? prod : 0
            }
            else {
                result[i] = prod / nums[i]
            }
        }
        return result
    }
}
