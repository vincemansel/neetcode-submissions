class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1

        // find pivot
        while l < r {
            let m = (l + r)/2
            if nums[m] > nums[r] {
                l = m + 1
            }
            else {
                r = m
            }
        }
        let pivot = l

        let res = binarySearch(nums,0,pivot-1,target)
        return res != -1 ? res : binarySearch(nums,pivot,nums.count-1,target)
    }

    private func binarySearch(_ nums: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        var l = left
        var r = right

        while l <= r {
            let m = (l + r)/2
            if target < nums[m] {
                r = m-1
            }
            else if target > nums[m] {
                l = m+1
            }
            else if target == nums[m] {
                return m
            }
        }
        return -1
    }
}
