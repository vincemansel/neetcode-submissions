// [Clean] hours now uses integer math, and exits for loop early
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = piles.max()!

        while l < r {
            let k = l + (r-l)/2
            var hours = 0
            for p in piles {
                hours += (p + k - 1) / k
                if hours > h { break }
            }
            if hours <= h {
                r = k
            }
            else {
                l = k + 1
            }
        }
        return l
    }
}
