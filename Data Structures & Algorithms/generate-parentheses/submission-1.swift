class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var results = [String]()
        var stack = ""

        func gen(_ openN: Int, _ closeN: Int) {
            if openN == n && closeN == n {
                results.append(stack)
                return
            }

            if openN < n {
                stack.append("(")
                gen(openN+1, closeN)
                stack.removeLast()
            }

            if closeN < openN {
                stack.append(")")
                gen(openN, closeN+1)
                stack.removeLast()
            }
        }

        gen(0, 0)
        return results
    }
}
