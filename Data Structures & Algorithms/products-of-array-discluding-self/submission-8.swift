// [Hint][lang] compile error: forget to declare let n = nums.count
// [Hint][boundary] Runtime Error (NZEC)
// - Did not initialie result array with a count of expected elements
// [Issue][state] - State updated incorrectly, bad ordering
// - Correct
/*
        for i in 0..<n {
            res[i] = prefix
            prefix *= nums[i]
        }

        for i in stride(from: n-1, through: 0, by: -1) {
            res[i] *= postfix
            postfix *= nums[i]
        }
*/
// - Incorrect
/*
        for i in 1..<n {
            prefix = prefix * nums[i-1]
            res[i-1] = prefix
        }

        for i in stride(from: n-2, through: 0, by: -1) {
            postfix = postfix * nums[i+1]
            res[i+1] *= postfix
        }
*/
// [Issue][approach] - Did not have exact update algo in head, so was guessing. I know the prefix/suffix array solution is O(n) space. This one is O(n) extra space.
// [Issue][boundary] - wrong answer, still attempting to fix issues after triaging from solution, initial loop started at 1 not 0.

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
