class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var result = [Int](repeating: 0, count: n)
        var stack = [(Int,Int)]()
        for (i,t) in temperatures.enumerated() {
            while !stack.isEmpty && t > stack.last!.1 {
                let (ci, _) = stack.removeLast()
                result[ci] = i - ci
            }
            stack.append((i,temperatures[i]))
        }
        return result
    }
}
