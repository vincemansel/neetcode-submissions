class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        var stack: [Character] = []

        func generate(_ openN: Int, _ closeN: Int) {
            if openN == n && closeN == n {
                result.append(String(stack))
                return
            }

            if openN < n {
                stack.append("(")
                generate(openN+1,closeN)
                stack.removeLast()
            }

            if closeN < openN {
                stack.append(")")
                generate(openN,closeN+1)
                stack.removeLast()
            }
        }

        generate(0,0)
        return result
    }
}
