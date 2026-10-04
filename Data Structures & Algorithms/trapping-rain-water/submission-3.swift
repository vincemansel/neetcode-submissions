// [Hint][lang] typo missing .count: var r = height-1
// [Hint][state] Wrong Answer: output 0, expecting 8
// - Correct: water += maxL - height[l]
// - Incorrect: water = maxL - height[l]
class Solution {
    // two pointers,
    // calculate trapped water from lower of two max
    func trap(_ height: [Int]) -> Int {
        var water = 0
        var l = 0
        var r = height.count-1
        var maxL = height[l]
        var maxR = height[r]

        while l < r {
            if maxL < maxR {
                l += 1
                maxL = max(maxL, height[l])
                water += maxL - height[l]
            }
            else {
                r -= 1
                maxR = max(maxR, height[r])
                water += maxR - height[r]
            }
        }

        return water
    }
}
