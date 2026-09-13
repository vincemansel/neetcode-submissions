class Solution {
    func trap(_ height: [Int]) -> Int {
        var l = 0, r = height.count - 1
        var maxL = height[l], maxR = height[r]
        var water = 0

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
