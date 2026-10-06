// [Hint][return] return nums[l] not l for this problem
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var (l,r) = (0, nums.count-1)

        while l < r {
            let m = l + (r-l)/2
            if nums[m] <= nums[r] {
                r = m
            }
            else {
                l = m+1
            }
        }
        return nums[l]
    }
}
