// [Hint][lang] bad function signature, forgot to specify target type
// - (Incorrect:)
/*
private func binarySearch(_ nums: [Int], _ target, _ left: Int, _ right: Int) -> Int
*/
// [Issue][boundary] Time Limit Exceeded
// [Issue][return] Starting both binarySearch func calls from l to pivot-1 and pivot to r not 0 and nums.count-1
// - Incorrect:
/*
        let left = binarySearch(nums,target,l,pivot-1)
        return left != -1 ? left : binarySearch(nums,target,pivot,r)
*/
// [Issue][boundary] Time Limit Exceeded
// Incorrect: while l <= right {
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count-1

        while l < r {
            let m = (l+r)/2
            if nums[r] < nums[m] {
                l = m+1
            }
            else {
                r = m
            }
        }

        let pivot = l

        let left = binarySearch(nums,target,0,pivot-1)
        return left != -1 ? left : binarySearch(nums,target,pivot,nums.count-1)
    }

    private func binarySearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
        var l = left
        var r = right

        while l <= r {
            let m = (l+r)/2

            if target < nums[m] {
                r = m - 1
            }
            else if target > nums[m] {
                l = m + 1
            }
            else if target == nums[m] {
                return m
            }
        }
        return -1
    }
}
