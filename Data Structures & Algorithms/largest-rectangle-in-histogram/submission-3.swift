// [Issue][approach] - Incorrect inner while, had the idea but ??? forgot
// [Issue][boundary]... etc.
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var stack = [(Int, Int)]() // index, height
        var maxArea = 0

        for r in 0..<n {
            var start = r
            while !stack.isEmpty && heights[r] <= stack.last!.1 {
                let (index, height) = stack.removeLast()
                let area = height * (r - index)
                maxArea = max(maxArea, area)
                start = index // extending smaller height back
            }
            stack.append((start,heights[r]))
        }

        for i in 0..<stack.count {
            maxArea = max(maxArea, stack[i].1 * (n - stack[i].0))
        }
        return maxArea
    }
}
