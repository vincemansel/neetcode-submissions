class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        // HEAP with K initiial elements
        // while window is valid
        // add new element
        // scan FIFO for max, append to output
        // drop 1st element of FIFO 

        var output = [Int]()
        var heap = Heap<Item>()

        for r in 0..<nums.count {
            heap.insert(Item(index: r, num: nums[r]))

            if r >= k - 1 {
                while heap.max!.index <= r - k {
                    heap.removeMax()
                }
                output.append(heap.max!.num)
            }
            
        }

        return output
    }
}

struct Item: Comparable {
    let index: Int
    let num: Int

    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.num < rhs.num
    }
}
