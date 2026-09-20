class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var stack = [(Int, Int)]() // (index, height)
        var maxArea = 0

        for i in 0..<n {
            var start = i
            while !stack.isEmpty && heights[i] < stack.last!.1 {
                let (stackInd, height) = stack.removeLast()
                maxArea = max(maxArea, (i - stackInd) * height)
                start = stackInd
            }
            stack.append((start,heights[i]))
        }

        for i in 0..<stack.count {
            let (index, height) = stack[i]
            maxArea = max(maxArea, height * (n - index) )
        }

        return maxArea
    }
}
