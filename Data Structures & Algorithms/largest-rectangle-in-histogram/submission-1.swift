class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var maxArea = 0
        var stack: [(Int, Int)] = [] // index, height

        for i in 0..<n {
            var start = i
            while !stack.isEmpty && heights[i] <= stack.last!.1 {
                let (index, height) = stack.removeLast()
                maxArea = max(maxArea, (i - index) * height)
                start = index // extending smaller h back
            }
            stack.append((start,heights[i]))
        }

        for i in 0..<stack.count {
            maxArea = max(maxArea, stack[i].1 * (n - stack[i].0))
        }

        return maxArea
    }
}
