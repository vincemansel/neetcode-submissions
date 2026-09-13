class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var lowest = Int.max
        var profit = 0

        for i in 0..<n {
            lowest = min(lowest, prices[i])
            profit = max(profit, prices[i] - lowest)
        }

        return profit
    }
}
