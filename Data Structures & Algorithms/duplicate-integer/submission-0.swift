class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var tracker = Set<Int>()

        for num in nums {
            if tracker.contains(num) {
                return true
            }
            tracker.insert(num)
        }

        return false
    }
}
