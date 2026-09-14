class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        var res = nums[l]

        while l <= r {
            if nums[l] < nums[r] {
                res = min(res, nums[l])
                break
            }

            let mid = (l + r)/2
            res = min(res, nums[mid])

            if nums[mid] >= nums[l] {
                l = mid+1
            }
            else {
                r = mid-1
            }
        }
        return res
    }
}
