// [Hint][lang] Must unwrap the optional
// - Correct: let minVal = min(val, minStack.last != nil ? minStack.last! : Int.max)
// - Incorrect: let minVal = min(val, minStack.last != nil ? minStack.last : Int.max)

class MinStack {
    var stack = [Int]()
    var minStack = [Int]()

    init() {}

    func push(_ val: Int) {
        stack.append(val)
        let minVal = min(val, minStack.last != nil ? minStack.last! : Int.max)
        minStack.append(minVal)
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        stack.last ?? Int.min
    }

    func getMin() -> Int {
        minStack.last ?? Int.min
    }
}
