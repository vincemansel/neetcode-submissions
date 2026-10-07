// [Hint][lang] typos
struct NumFreq: Comparable {
    let num: Int
    let freq: Int

    static func < (lhs: NumFreq, rhs: NumFreq) -> Bool {
        lhs.freq < rhs.freq
    }
}

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var heap = Heap<NumFreq>()
        var collector = [Int:Int]()
        var res = [Int]()

        for num in nums {
            collector[num, default: 0] += 1
        }

        for (num,freq) in collector {
            heap.insert(NumFreq(num: num, freq: freq))
            if heap.count > k {
                heap.removeMin()
            }
        }

        while let numFreq = heap.popMin() {
            res.append(numFreq.num)
        }

        return res
    }
}
