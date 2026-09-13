class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var water = 0
        var l = 0, r = heights.count - 1

        while l < r {
            let current = (r - l) * min(heights[l], heights[r])
            water = max(water,current)

            if heights[l] < heights[r] {
                l += 1
            }
            else {
                r -= 1
            }
        }
        return water
    }
}
