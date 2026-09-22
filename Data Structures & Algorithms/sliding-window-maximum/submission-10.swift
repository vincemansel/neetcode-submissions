class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var deque = [Int]() // index

        var l = 0, r = 0

        while r < nums.count {
            while !deque.isEmpty && nums[deque.last!] < nums[r] {
                deque.removeLast()
            }
            deque.append(r)

            //if l > deque.first! {
            if deque.first! < r - k + 1 {
                deque.removeFirst()
            }

            if (r+1) >= k {
                result.append(nums[deque.first!])
                l += 1
            }
            r += 1
        }
        return result
    }
}
