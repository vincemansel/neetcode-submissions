// [Hint][lang] Not required to unwrap Double to Int >> k += Int(ceil(Double(p) / Double(m)))!
// [Hint][lang] l and r declared as let constants
// [Hint][return] attempting to return k, must be res
// [Hint][boundary] Time Limit Exceeded
// [Issue][approach] correct to use binary search, but wrong algo to approximate k. I started with calculating time but did not employ as the mid point between l and r. Also boundary condition on while must be l <= r, not l < r
// - Incorect:
/*
        while l < r {
            let m = (l + r)/2
            var k = 0
            for p in piles {
                k += Int(ceil(Double(p) / Double(m)))
            }
            if k <= h {
                res = k
                r = k - 1
            }
            else {
                l = k + 1
            }
        }
*/
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = piles.max()!
        var res = 0

        while l <= r {
            let k = (l + r)/2
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
