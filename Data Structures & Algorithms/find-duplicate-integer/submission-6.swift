// [Clean]
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var fast = 0
        var slow = 0

        while true {
            fast = nums[nums[fast]]
            slow = nums[slow]

            if fast == slow {
                break
            }
        }

        var slow2 = 0

        while slow != slow2 {
            slow = nums[slow]
            slow2 = nums[slow2]
        }

        return slow2
    }
}
