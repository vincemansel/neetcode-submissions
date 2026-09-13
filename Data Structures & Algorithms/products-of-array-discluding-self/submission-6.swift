class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var prefix = [Int](repeating: 0, count: n)
        var postfix = [Int](repeating: 0, count: n)
        var result = [Int]()

        prefix[0] = 1
        postfix[n-1] = 1

        for i in 1..<n {
            prefix[i] = prefix[i-1] * nums[i-1]
        }

        for i in stride(from: n-2, through: 0, by: -1) {
            postfix[i] = postfix[i+1] * nums[i+1]
        }

        for i in 0..<n {
            result.append(prefix[i] * postfix[i])
        }

        return result
    }
}
