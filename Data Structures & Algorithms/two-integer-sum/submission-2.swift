class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var table = [Int:Int]()

        for i in 0..<nums.count {
            let diff = target - nums[i]
            if let x = table[diff] {
                return [x,i]
            }
            table[nums[i]] = i
        }

        return []
    }
}
