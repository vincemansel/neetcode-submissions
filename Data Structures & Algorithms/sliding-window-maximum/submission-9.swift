class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var output = [Int]()
        var deque = [Int]() // index

        var r = 0, l = 0

        while r < nums.count {
            // trim smaller items

            while !deque.isEmpty && nums[deque.last!] < nums[r] {
                deque.removeLast()
            }
            deque.append(r)

            if l > deque.first! {
                deque.removeFirst()
            }

            if (r+1) >= k {
                output.append(nums[deque.first!])
                l += 1
            }
            r += 1
        }

        return output
    }
}
