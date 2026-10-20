// [Hint][approach] = did not read problem, using mid calcualation in binary search, not comparing sum to target
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var (l, r) = (0, numbers.count - 1)

        while l <= r {
            let sum = numbers[l] + numbers[r]
            if sum < target {
                l += 1
            }
            else if sum > target {
                r -= 1
            }
            else {
                return [l+1,r+1]
            }
        }

        return [-1,-1]
    }
}
