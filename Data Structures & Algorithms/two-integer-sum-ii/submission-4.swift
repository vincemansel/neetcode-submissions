class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        var l = 0
        var r = numbers.count-1

        while l < r {
            let sum = numbers[l] + numbers[r]

            if target == sum {
                return [l+1, r+1]
            }
            else if target > sum {
                l += 1
            }
            else {
                r -= 1
            }
        }

        return [-1, -1]
    }
}
