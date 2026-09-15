class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var buy = prices[0]


        for i in 1..<prices.count {
            profit = max(profit,prices[i]-buy)
            buy = min(buy,prices[i])
        }

        return profit
    }
}
