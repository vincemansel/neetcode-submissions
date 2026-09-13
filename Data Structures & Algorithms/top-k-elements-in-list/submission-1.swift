class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freq = [Int:Int]()

        for num in nums {
            freq[num, default: 0] += 1
        }

        var count = [(Int, Int)]()
        for (num, cnt) in freq {
            count.append((cnt,num))
        }

        count.sort { $0.0 > $1.0 }

        var output = [Int]()

        for i in 0..<k {
            output.append(count[i].1)
        }

        return output
    }
}
