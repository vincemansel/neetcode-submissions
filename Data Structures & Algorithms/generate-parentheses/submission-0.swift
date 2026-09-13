class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var results = [String]()
        var stack = [Character]()

        func genP(_ openN: Int, _ closeN: Int) {

            if openN == n && closeN == n {
                results.append(String(stack))
                return
            }

            if openN < n {
                stack.append("(")
                genP(openN+1,closeN)
                stack.removeLast()
            }

            if closeN < openN {
                stack.append(")")
                genP(openN,closeN+1)
                stack.removeLast()
            }
        }

        genP(0, 0)
        return results
    }
}
