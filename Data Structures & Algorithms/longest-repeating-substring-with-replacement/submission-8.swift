// [Issue][state] Wrong answer: input s="AAABABB", k=1
// - output 3, expected 5
// Must maximize maxF versus current character in freq map
// -- not the entire freq map
// - Correct:  maxf = max(maxf, freq[c]!)
// - Incorrect:  maxf = max(maxf, freq.count)

class Solution {
    // maxF is current size of Character (frequency) in freq map
    // - for the character consider
    // freq map built per step
    // assign res when current window max
    // decrease window when current window size - max exceeds K
    // i.e. increment l pointer
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var freq = [Character:Int]()
        var l = 0
        let s = Array(s)
        var maxF = 0
        var res = 0

        for r in 0..<s.count {
            let c = s[r]
            freq[c, default: 0] += 1
            maxF = max(maxF, freq[c]!)

            if (r - l + 1) - maxF > k {
                freq[s[l], default: 0] -= 1
                l += 1
            }
            res = max(res, r-l+1)
        }
        return res
    }
}
