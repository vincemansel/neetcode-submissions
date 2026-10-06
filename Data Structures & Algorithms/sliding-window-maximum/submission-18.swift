// [Hint][lang] Must define r if using as condition of while loop
class Solution {
    /*
    track right
    reduce deque of index when new value exceeds value at deque.last
    add each new index to deque
    reduce window when l is greater than deque.first
    record res when r+1 >= k, and increment l
    */
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res = [Int]()
        var deque = Deque<Int>() // Index
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
