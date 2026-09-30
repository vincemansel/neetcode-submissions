// [Hint][approach] - forgot the precise algo but structure was near perfect
// [Issue][boundary] - slightly off, looked at answer
// - Incorrect
/*
        while l <= r {
            let m = (l + r)/2
            if nums[l] == nums[m] { // BAD COMPARISON
                return nums[l]
            }
            if nums[l] > nums[m] { // leads to wrong pointer update
                l = m + 1
            }
            else {
                r = m
            }
        }
*/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1

        while l <= r {
            if nums[l] == nums[r] {
                return nums[l]
            }
            let m = (l + r)/2
            if nums[r] < nums[m] {
                l = m + 1
            }
            else {
                r = m
            }
        }
        return -1001
    }
}
