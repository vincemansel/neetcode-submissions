// [Hint][lang] bad argument passed binarySearch func
// [Issue][state] Wrong Answer. returning value not index
class Solution {
    // use findMin to get pivot
    // Use pivot to search left half, or right half
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1

        while l < r {
            let m = l + (r-l)/2

            if nums[m] <= nums[r] {
                r = m
            }
            else {
                l = m + 1
            }
        }
        let pivot = l

        let left = binarySearch(nums,target,0,pivot-1)
        return left != -1 ? left :
            binarySearch(nums,target,pivot,nums.count-1)
    }

    private func binarySearch(
        _ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
            var l = left
            var r = right

            while l <= r {
                let m = l + (r-l)/2
                if nums[m] < target {
                    l = m + 1
                }
                else if nums[m] > target {
                    r = m - 1
                }
                else {
                    return m
                }
            }
            return -1
        }
}
