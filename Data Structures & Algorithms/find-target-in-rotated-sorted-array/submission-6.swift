class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1

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

        let left = binarySearch(nums,target,0,pivot-1)

        return left != -1 ? left : binarySearch(nums,target,pivot,nums.count-1)
    }

    private func binarySearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {

        var l = left, r = right

        while l <= r {
            let m = (l + r)/2
            if target == nums[m] {
                return m
            }
            else if target < nums[m] {
                r = m - 1
            }
            else if target > nums[m] {
                l = m + 1
            }
        }
        return -1
    }
}
