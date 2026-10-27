// [clean]
class Solution {
    /*
    stack
    append numbers
    pop on operation
    */
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for t in tokens {
            if let num = Int(String(t)) {
                stack.append(num)
            }
            else {
                let op1 = stack.removeLast()
                let op2 = stack.removeLast()
                var res = 0
                switch t {
                   case "+":
                   res = op1 + op2
                   case "-":
                   res = op2 - op1
                   case "*":
                   res = op1 * op2
                   case "/":
                   res = op2 / op1
                   default: 
                   return Int.min
                }
                stack.append(res)
            }
        }
        
        return stack.last!

    }
}
