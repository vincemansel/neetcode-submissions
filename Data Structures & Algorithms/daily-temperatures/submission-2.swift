class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var result = Array<Int>(repeating: 0, count: n)
        var stack:[(Int, Int)] = []

        for (i,t) in temperatures.enumerated() {
            while !stack.isEmpty && t > stack.last!.0 {
                let (_, ci) = stack.removeLast()
                result[ci] = i - ci
            }
            stack.append((t,i))
        }
        return result
    }
}
