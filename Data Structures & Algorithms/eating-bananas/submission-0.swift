class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = piles.max()!
        var res = r

        while l <= r {
            let k = l + (r - l)/2
            
            var total = 0
            for p in piles {
                total += Int(ceil(Double(p)/Double(k)))
            }

            if total <= h {
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
