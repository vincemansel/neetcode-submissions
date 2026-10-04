// [Hint][lang] typo on binarySearch func signature
// - Incorrect: func binarySearch(_ l: Int, r: Int) -> Int
// - the r variable missing the "_" expected at callsite
class Solution {
    // find the pivot
    func search(_ nums: [Int], _ target: Int) -> Int {
        var (l, r) = (0, nums.count-1)

        while l < r {
            let m = l + (r-l)/2

            if nums[m] <= nums[r] {
                r = m
            }
            else {
                l = m+1
            }
        }
        let pivot = l

        func binarySearch(_ l: Int, _ r: Int) -> Int {
            var (l,r) = (l,r)

            while l <= r {
                let m = l + (r-l)/2
                if nums[m] < target {
                    l = m+1
                }
                else if nums[m] > target {
                    r = m-1
                }
                else {
                    return m
                }
            }
            return -1
        }

        let left = binarySearch(0, pivot-1)
        return left != -1 ? left : binarySearch(pivot,nums.count-1)
    }
}
