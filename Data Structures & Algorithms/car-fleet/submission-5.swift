class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let pairs = zip(position,speed).sorted {$0.0 > $1.0}
        var stack = [Double]()

        for (position,speed) in pairs {
            let distance = target - position
            let time = Double(distance) / Double(speed)
            stack.append(time)

            if stack.count >= 2 && stack.last! <= stack[stack.count - 2] {
                stack.removeLast()
            }
        }

        return stack.count
    }
}
