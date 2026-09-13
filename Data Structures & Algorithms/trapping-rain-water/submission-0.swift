class Solution {
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        var trapped = 0
        var maxLeft = [Int](repeating:0, count: n)
        var maxRight = [Int](repeating:0, count: n)
        
        var last = 0
        for i in 1..<n {
            maxLeft[i] = max(last,height[i-1])
            last = maxLeft[i]
        }
        last = 0
        for j in stride(from: n-2, through:0, by: -1) {
            maxRight[j] = max(last,height[j+1])
            last = maxRight[j]
        }
        // t = min(L,R) - h(i)
        for i in 0..<n {
            let water = min(maxLeft[i], maxRight[i]) - height[i]
            trapped += water > 0 ? water : 0
        }

        return trapped
    }
}
