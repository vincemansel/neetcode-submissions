// [Clean]
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var counts = [Int:Int]()
        var freq = [[Int]](repeating: [], count: n+1)
        var result = [Int]()

        for num in nums {
            counts[num, default: 0] += 1
        }

        for (num,cnt) in counts {
            freq[cnt].append(num)
        }

        for i in stride(from: n, through: 1, by: -1) {
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
