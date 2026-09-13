class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        var stack = [(Int, Int)]() // index, height

        for (i,h) in heights.enumerated() {
            var start = i
            while !stack.isEmpty && h < stack.last!.1 {
                let (index, height) = stack.removeLast()
                start = index
                maxArea = max(maxArea, (i - index) * height)
            }
            stack.append((start,h))
        }

        for (i,h) in stack {
            maxArea = max(maxArea, (heights.count - i) * h)
        }

        return maxArea
    }
}
