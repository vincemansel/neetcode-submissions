// [Hint][state] - empty the stack to allow smaller height with longer tail to be considered in maxArea calculation. ie.
// - Correct: stack.append((start,heights[i]))
// - IncorrectL stack.append((i,heights[i]))
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var maxArea = 0
        var stack: [(Int,Int)] = [] // index, height

        for i in 0..<n {
            var start = i
            while !stack.isEmpty && heights[i] <= stack.last!.1 {
                let (index, height) = stack.removeLast()
                let area = height * (i - index)
                maxArea = max(maxArea, area)
                start = index
            }
            stack.append((start,heights[i]))
        }

        for i in 0..<stack.count {
            maxArea = max(maxArea, stack[i].1 * (n - stack[i].0))
        }

        return maxArea
    }
}
