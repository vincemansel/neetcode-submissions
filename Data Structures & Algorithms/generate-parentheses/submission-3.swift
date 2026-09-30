// [Clean]
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        var stack = [Character]()

        func genP(_ openN: Int, _ closedN: Int) {
            if openN == n && closedN == n {
                result.append(String(stack))
                return
            }

            if openN < n {
                stack.append("(")
                genP(openN+1, closedN)
                stack.removeLast()
            }

            if closedN < openN {
                stack.append(")")
                genP(openN,closedN+1)
                stack.removeLast()
            }
        }

        genP(0,0)
        return result
    }
}
