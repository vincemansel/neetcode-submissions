class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = [Int](repeating: 1, count: n)

        var prefix = 1
        var postfix = 1

        for i in 0..<n {
            result[i] = prefix
            prefix *= nums[i]
        }

        for i in stride(from: n-1, through: 0, by: -1) {
            result[i] *= postfix
            postfix *= nums[i]
        }

        return result
    }
}
