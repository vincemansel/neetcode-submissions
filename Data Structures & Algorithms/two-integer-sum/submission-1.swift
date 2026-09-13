class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()

        for i in 0..<nums.count {
            map[nums[i]] = i
        }

        for i in 0..<nums.count {
            let diff = target - nums[i]
            if let j = map[diff], j != i {
                return [i,j]
            }
        }

        return []
    }
}
