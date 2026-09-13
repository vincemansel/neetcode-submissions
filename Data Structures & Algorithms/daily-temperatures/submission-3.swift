class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var result = [Int](repeating: 0, count: n)
        var stack: [(Int, Int)] = [] // temp, index
        
        for (i,t) in temperatures.enumerated() {
            while !stack.isEmpty && t > stack.last!.0 {
                let (_, index) = stack.removeLast()
                result[index] = i - index
            }
            stack.append((t,i))
        }
        return result
    }
}
