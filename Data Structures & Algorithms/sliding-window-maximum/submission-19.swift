// [Clean]
class Solution {
    // fixed window
    // deque of index
    // remove indexes of lesser values
    // remove first index when left point > first index
    // move left of window each step after r+1 >= k
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var deque = Deque<Int>()
        var res = [Int]()
        var l = 0

        for r in 0..<nums.count {
            while !deque.isEmpty && nums[deque.last!] < nums[r] {
                deque.removeLast()
            }
            deque.append(r)

            if l > deque.first! {
                deque.removeFirst()
            }

            if (r+1) >= k {
                res.append(nums[deque.first!])
                l += 1
            }
        }
        return res
    }
}
