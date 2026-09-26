class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1

        while l <= r {
            if nums[l] <= nums[r] {
                return nums[l]
            }

            let m = (l + r)/2

            if nums[r] < nums[m] {
                l = m+1
            }
            else {
                r = m
            }
        }

        return nums[l]
    }
}
