class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        
        var fast = 0
        var slow = 0

        while true {
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast {
                break
            }
        }

        var second = 0
        while true {
            second = nums[second]
            slow = nums[slow]
            if second == slow {
                return slow
            }
        }
    }
}
