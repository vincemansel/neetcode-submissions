// [Hint][lang] Must use if to start conditional
// - Incorrect:                 else ***if*** nums[m] > target {
// [Hint][lang] Be consistent with variable names (habits!)
// -         var l = 0, right = nums.count - 1 // (use r instead)
class Solution {
    // findMin for pivot
    // binarySearch left and right of pivot
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1

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

        func binarySearch(_ left: Int, _ right: Int) -> Int {
            var l = left, r = right

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

        let left = binarySearch(0,pivot-1)
        return left != -1 ? left : binarySearch(pivot,nums.count-1)
    }
}
