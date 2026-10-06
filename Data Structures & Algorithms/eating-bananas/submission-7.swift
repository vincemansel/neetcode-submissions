// [Hint][boundary] Wrong Answer
// - Correct: guard hours <= h else { break }
// - Incorrect: guard hours < k else { break }
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var (l,r) = (1, piles.max()!)

        while l < r {
            let k = l + (r-l)/2
            var hours = 0
            for b in piles {
                hours += (b + k - 1)/k
                guard hours <= h else { break } // Efficiency only!
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
