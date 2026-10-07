// [Clean]
class KthLargest {
    var heap = Heap<Int>()
    let k: Int
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            add(num)
        }
    }

    @discardableResult
    func add(_ val: Int) -> Int {
        heap.insert(val)
        if heap.count > k {
            heap.removeMin()
        }
        return heap.min!
    }
}
