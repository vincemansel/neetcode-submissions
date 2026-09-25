class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var res = [Int](repeating: 0, count: n)

        var prefix = 1
        var postfix = 1

        for i in 0..<n {
            res[i] = prefix
            prefix *= nums[i]
        }

        for i in stride(from: n-1, through: 0, by: -1) {
            res[i] *= postfix
            postfix *= nums[i]
        }

        return res
    }
}
