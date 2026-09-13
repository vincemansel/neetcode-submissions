class Solution {
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        var prefix = [Int](repeating: 0, count: n)
        var suffix = [Int](repeating: 0, count: n)
        var water = 0

        prefix[0] = height[0]
        suffix[n-1] = height[n-1]

        for i in 1..<n {
            prefix[i] = max(prefix[i-1], height[i])
        }

        for i in stride(from: n-2, through: 0, by: -1) {
            suffix[i] = max(suffix[i+1],height[i])
        }

        for i in 0..<n {
            water += min(prefix[i], suffix[i]) - height[i]
        }

        return water
    }
}
