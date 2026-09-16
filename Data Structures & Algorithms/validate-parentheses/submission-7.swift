class Solution {
    func isValid(_ s: String) -> Bool {
        let arr = Array(s)
        var stack: [Character] = []

        for c in arr {
            switch c {
                case "(", "{", "[":
                    stack.append(c)
                default:
                    guard !stack.isEmpty else
                    { return false }
                    let stored = stack.removeLast()
                    if stored == "(" && c != ")" ||
                       stored == "{" && c != "}" ||
                       stored == "[" && c != "]"
                    {
                        return false
                    }
            }
        }

        return stack.isEmpty
    }
}
