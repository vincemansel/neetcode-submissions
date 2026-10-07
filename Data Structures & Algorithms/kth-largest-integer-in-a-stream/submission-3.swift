class KthLargest {
    var hiHeap = Heap<Int>()
    let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k

        for num in nums {
            _ = add(num)
        }
    }

    func add(_ val: Int) -> Int {
        hiHeap.insert(val)
        if hiHeap.count > k {
            hiHeap.removeMin()
        }
        return hiHeap.min ?? -1001
    }
}
