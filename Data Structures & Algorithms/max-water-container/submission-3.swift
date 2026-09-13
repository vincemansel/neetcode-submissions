class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var area = 0
        var i = 0
        var j = heights.count - 1

        while i < j {
            let cur = (j - i) * min(heights[i], heights[j])
            area = max(area, cur)

            if heights[i] <= heights[j] {
                i += 1
            }
            else {
                j -= 1
            }
        }

        return area
    }
}
