// [Hint][boundary] Wrong Answer: piles=[25,10,23,4] h=4
// output: 10, expected 25
// - Partial Correct:         var l = 1, r = piles.max()!
// - Incorrect:         var l = 0, r = piles.max()!
// - Correct:                if hours > h { break }
// - Incorrect:               if hours >= h { break }
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = piles.max()!

        while l < r {
            let k = l + (r-l)/2
            var hours = 0
            for b in piles {
                hours += (b + k - 1)/k
                if hours > h { break }
            }
            if hours <= h {
                r = k
            }
            else {
                l = k+1
            }
        }
        return l
    }
}
