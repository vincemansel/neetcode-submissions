class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // Find the pivot
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

        func binarySearch(_ left: Int, _ right: Int, _ target: Int) -> Int {
            var l = left, r = right
            while l <= r {
                let m = (l + r)/2
                if target == nums[m] {
                    return m
                }
                else if nums[m] < target {
                    l = m+1
                }
                else {
                    r = m-1
                }
            }
            return -1
        }
        let lh = binarySearch(0,pivot-1,target) 
        return lh != -1 ? lh : binarySearch(pivot,nums.count-1,target)

    }
}
