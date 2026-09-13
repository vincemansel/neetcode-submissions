class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = [Int](repeating: 0, count: n)
        var prefix = [Int](repeating: 0, count: n)
        var suffix = [Int](repeating: 0, count: n)

        prefix[0] = 1
        suffix[n-1] = 1

        for i in 1..<n {
            prefix[i] = nums[i-1] * prefix[i-1]
        }

        for i in stride(from: n-2, through: 0, by: -1) {
            suffix[i] = nums[i+1] * suffix[i+1]
        }

        for i in 0..<n {
            result[i] = prefix[i] * suffix[i]
        }
       
        return result
    }
}
