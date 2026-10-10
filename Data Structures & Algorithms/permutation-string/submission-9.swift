// [Hint][approach] For let s2 = Array(s2
// [Hint][lang] forgot to unwrap optional 
// = if let count = freq[c], window[c]! <= count {
// [Issue][boundary] Wrong Answer,
// - Forgot to shrink window:
/*
                 if r - l + 1 >= s1.count {
                    window[s2[l], default: 0] -= 1
                    l += 1
                }
*/
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var freq = [Character:Int]()
        var window = [Character:Int]()
        var l = 0

        for c in s1 {
            freq[c, default: 0] += 1
        }

        let s2 = Array(s2)

        for r in 0..<s2.count {
            let c = s2[r]
            
            if freq[c] != nil {
                window[c, default: 0] += 1
               
                if window == freq {
                    return true
                }
                if r - l + 1 >= s1.count {
                    window[s2[l], default: 0] -= 1
                    l += 1
                }
            }
            else {
                window = [Character:Int]()
                l = r + 1
            }
        } 
        return false
    }
}
