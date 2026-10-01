// [Hint][boundary] Time Limit Exceeded
// - Incorrect: while l <= r { ... will never converge with r = k
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = piles.max()!

        while l < r {
            let k = l + (r-l)/2
            var totalTime = 0
            for p in piles {
                totalTime += Int(ceil(Double(p) / Double(k)))
            }

            if totalTime <= h {
                r = k
            }
            else {
                l = k+1
            }
        }
        return l
    }
}
