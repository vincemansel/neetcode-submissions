// [Hint][lang] or i in 0..<nums - error: cannot convert value of type '[Int]' to expected argument type 'Int'
// [Hint][lang]  indexer[num] = i - error: cannot find 'num' in scope
// [Hint][lang] stack.append(indexer(nums[r])) - error: cannot call value of non-function type '[Int : Int]'
// [Hint][lang] stack.append(indexer[nums[r]]) - error: value of optional type 'Int?' must be unwrapped to a value of type 'Int'
// [Issue][boundary] Runtime Error (NZEC)
// [Issue] [ds] - Picked stack, not a deque, functionally the same but a deque can exit values from both sides
// [Issue] [ds] - Added an additional indexer hashmap think to track index of numbers presented to remove left most item from queue and shrink window
// [Issue][time] required 35-40 minutes to resolve to search prior solution
// [Issue][approach] Use wrong ds element to prevent smaller elements from entering the deque,i.e.
// - Correct:
// - while !deque.isEmpty && nums[deque.last!] < nums[r]
// - Incorrect:
// - while !stack.isEmpty && stack.last! < nums[r]
// [Issue][state] Attempting to adjust left pointer in first while loop - not required here.
// [Issue][state] Attempting to append the right index through a non-required ds into the (deque) disquised as a stack
// - Correct
// -  deque.append(r)
// - Incorrect
// -  stack.append(indexer[nums[r]]!)
// [Issue][approach] Attempting to prune deque slightly misalighn
// - Correct
/*
            if l > deque.first! {
                deque.removeFirst()
            }
            // - or - 
            if deque.first! < r - k + 1 {
                deque.removeFirst()
            }
*/
// - Incorrect
/*
            if (r - indexer[nums[l]]! + 1) > k {
                stack.removeFirst()
                l += 1
            }
*/
// [Issue][approach] - Attempting to save the max but not decreasing the window size
// - Correct
/*
            if (r+1) >= k {
                result.append(nums[deque.first!])
                l += 1
            }
            r += 1
*/
// - Incorrect
/*
            if r > k {
                result.append(stack.last!)
            }

            r += 1
*/

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
