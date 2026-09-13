class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        var i = 0, j = numbers.count-1

        while i < j {
            let sum = numbers[j] + numbers[i]

            if sum == target {
                return [i+1, j+1]
            }
            else if sum > target {
                j -= 1
            }
            else {
                i += 1
            }
        }

        return [-1,-1]
    }
}
