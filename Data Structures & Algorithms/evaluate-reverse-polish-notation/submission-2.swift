class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [String]()
        let tokenSet = Set<String>(["+", "-", "*", "/"])
        var expr = 0
        let INVALID = Int.min

        for token in tokens {
            if tokenSet.contains(token) {
                if stack.count >= 2 {
                    let oper1 = Int(stack.removeLast())!
                    let oper2 = Int(stack.removeLast())!

                    if token == "+" {
                        expr = oper2 + oper1
                    }
                    else if token == "-" {
                        expr = oper2 - oper1
                    }
                    else if token == "*" {
                        expr = oper2 * oper1
                    }
                    else if token == "/" {
                        expr = oper2 / oper1
                    }
                    else {
                        return INVALID
                    }
                    stack.append(String(expr))
                }
                else {
                    return INVALID
                }
            }
            else {
                stack.append(token)
            }
        }

		return Int(stack.last!)!
    }
}
