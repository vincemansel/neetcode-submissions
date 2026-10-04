// [Hint][lang] typo: *in* not *if* for num if freq[i] {
class Solution {
    // Collect in hashMap: value:count
    // append to freq array count -> [values]
    // = n+1 to handle duplicate corner case
    // reverse walk freq until k reached
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var res = [Int]()
        var counts = [Int:Int]()
        var freq = [[Int]](repeating: [], count: n+1)

        for num in nums {
            counts[num, default: 0] += 1
        }

        for (num,cnt) in counts {
            freq[cnt].append(num)
        }

        for i in stride(from: n, through: 0, by: -1) {
            for num in freq[i] {
                res.append(num)
                if res.count == k {
                    return res
                }
            }
        }
        return res
    }
}
