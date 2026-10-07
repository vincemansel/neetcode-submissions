// [Hint][lang] typo: Error in dictionary literal
// [Hint][return] Wrong answer, forgot to check in stack is empty
class Solution {
    func isValid(_ s: String) -> Bool {
        var toClose:[Character:Character] =
        [")":"(", "}":"{", "]":"["]
        var stack = [Character]()

        for c in s {
            if toClose[c] == nil {
                stack.append(c)
            }
            else if !stack.isEmpty {
                if let x = toClose[c], x != stack.last! {
                    return false
                }
                stack.removeLast()
            }
            else {
                return false
            }
        }
        return stack.isEmpty
    }
}
