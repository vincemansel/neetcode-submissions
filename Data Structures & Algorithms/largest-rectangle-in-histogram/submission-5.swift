// [Issue][state]
// forget to update start in while:  start = index
// using wrong count
// - Correct: maxArea = max(maxArea, stack[i].1 * (heights.count - stack[i].0))
// - Incorrect: maxArea = max(maxArea, stack[i].1 * (stack.count - stack[i].0))

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [(Int, Int)]() // index, height
        var maxArea = 0

        for (i,h) in heights.enumerated() {
            var start = i

            while !stack.isEmpty && stack.last!.1 >= h {
                let (index, height) = stack.removeLast()
                let area = (i - index) * height
                maxArea = max(maxArea, area)
                start = index
            }
            stack.append((start, h))
        }

        for i in 0..<stack.count {
            maxArea = max(maxArea, stack[i].1 * (heights.count - stack[i].0))
        }

        return maxArea
    }
}
