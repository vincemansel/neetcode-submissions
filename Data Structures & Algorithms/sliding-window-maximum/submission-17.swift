// [Hint][boundary] Wrong answer: [2,4,4] expected: [2,2,4,4,6]
// - Parital Correct: if (r+1) >= k ...
// - Incorrect: if (r+1) > k yields [2,2,4,4]
// - Correct: while r < nums.count
// - Incorrect: while r < nums.count-1
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res = [Int]()
        var deque = Deque<Int>() // Index
        var l = 0, r = 0

        while r < nums.count {
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
            r += 1
        }
        return res
    }
}
