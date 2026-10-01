// [Hint][state] Wrong answer. Incorrectly re-using prefix in postfix updater
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var res = [Int](repeating: 0, count: n)
        var prefix = 1
        var postfix = 1

        // 1,2,4,6 - 1
        // 0.0.0.0 -
        //for
        // 0 1.0.0.0 - 1
        // 1 1.1.0.0 - 2
        // 2 1.1.2.0 - 8
        // 3 1.1.2.8 - 48
        for i in 0..<n {
            res[i] = prefix
            prefix *= nums[i]
        }
        //   1,2,4,6
        //   1.1.2.8 - 1
        // 3 1.1.2.8 - 6
        // 2 1.1.12.8 - 24
        // 1 1.24.12.8 - 48
        // 0 48,24,12,8
        
        for i in stride(from: n-1, through: 0, by: -1) {
            res[i] *= postfix
            postfix *= nums[i]
        }

        return res
    }
}
