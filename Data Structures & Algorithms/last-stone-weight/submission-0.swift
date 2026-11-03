// [clean]
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var heap = Heap<Int>()

        for s in stones {
            heap.insert(s)
        }

        while heap.count > 1 {
            let s1 = heap.popMax()!
            let s2 = heap.popMax()!

            if s1 == s2 { continue }
            heap.insert(abs(s1-s2))
        }

        return heap.popMin() ?? 0
    }
}
