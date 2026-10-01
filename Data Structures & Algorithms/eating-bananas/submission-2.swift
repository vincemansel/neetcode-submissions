// [Hint][boundary] Wrong answer
// Incorrect - while l < r // must  be: while l <= r to converge
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = piles.max()!
        var res = 0

        while l <= r {
            let k = (l+r)/2
            var totalTime = 0
            for bananas in piles {
                totalTime += Int(ceil(Double(bananas) / Double(k)))
            }

            if totalTime <= h {
                res = k
                r = k - 1
            }
            else {
                l = k + 1
            }
        }
        return res
    }
}
