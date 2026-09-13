class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = Array(s)

        var i = 0, j = s.count-1

        while i < j {
            if !isValid(s[i]) {
                i += 1
                continue
            }
            if !isValid(s[j]) {
                j -= 1
                continue
            }

            if s[i].lowercased() != s[j].lowercased() {
                return false
            }
            i += 1
            j -= 1
        }

        return true
    }

    func isValid(_ c: Character) -> Bool {
        return c.isNumber || c.isLetter
    }
}
