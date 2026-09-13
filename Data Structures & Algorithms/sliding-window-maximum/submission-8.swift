class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var output = [Int]()
        var deque = [Int]() // index

        var r = 0, l = 0

        // r = 0 1 2 3 4 5 6 7
        // l = 0 1 2 3 4 5
        // deque = 6
        // output = [2, 2, 4, 4, 6
        while r < nums.count {
            // remove smaller items indices from deque
            while !deque.isEmpty && nums[deque.last!] < nums[r] {
                deque.removeLast()
            }
            deque.append(r)

            // prune off top of deque when left pointer exceeds top of deque
            if l > deque.first! {
                deque.removeFirst()
            }

            // output for every new K window
            if r + 1 >= k {
                output.append(nums[deque.first!])
                l += 1
            }
            r += 1
        }

        return output
    }
}
