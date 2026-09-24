class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [(Int, Int)]()
        var result = [Int](repeating: 0, count: temperatures.count )

        for (i,t) in temperatures.enumerated() {
            while !stack.isEmpty && t > stack.last!.1 {
                let (stackIndex, _) = stack.removeLast()
                result[stackIndex] = (i - stackIndex)
            }

            stack.append((i,t))
        }
        return result
    }
}
