class Solution {
    struct NumFreq: Comparable {
        var num: Int
        var freq: Int

        static func < (lhs: NumFreq, rhs: NumFreq) -> Bool {
            return lhs.freq < rhs.freq
        }
    }

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var heap = Heap<NumFreq>()
        var collector = [Int:Int]()
        var result = [Int]()

        for num in nums {
            collector[num, default: 0] += 1
        }

        for (num,freq) in collector {
            heap.insert(NumFreq(num: num, freq: freq))
            if heap.count > k {
                heap.removeMin()
            }
        }

        while result.count < k {
            result.append(heap.removeMin().num)
        }

        return result
    }
}
