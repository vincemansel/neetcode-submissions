class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var numSet = Set<Int>()

        for num in nums {
            if numSet.contains(num) {
                return num
            }
            numSet.insert(num)
        }

        return -1
    }
}
