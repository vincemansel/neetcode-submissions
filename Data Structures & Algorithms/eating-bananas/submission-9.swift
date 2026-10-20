
// [Issue][boundary] - wrong answer on piles=[3,6,7,11], h=8
// - Correct: if hours <= h {
// - Incorrect: if hours < h {
class Solution {
    /*
    l, r between 1 and max of piles
    use binary search for k
    for a given k, find hours needed below k
    */
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var (l, r) = (1, piles.max()!)

        while l < r {
            let k = l + (r-l)/2
            var hours = 0
            for p in piles {
                hours += (p + k - 1)/k
                guard hours <= h else { break }
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
