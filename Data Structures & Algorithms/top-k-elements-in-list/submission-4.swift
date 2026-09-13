class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counts = [Int:Int]()
        var freq = [[Int]](repeating: [], count: nums.count + 1)
        var result = [Int]()

        for num in nums {
            counts[num, default: 0] += 1
        }

        for (num, count) in counts {
            freq[count].append(num)
        }

        for i in stride(from: freq.count - 1, through: 1, by: -1) {
            for num in freq[i] {
                result.append(num)
                if result.count == k {
                    return result
                }
            }
        }

        return result
    }
}
