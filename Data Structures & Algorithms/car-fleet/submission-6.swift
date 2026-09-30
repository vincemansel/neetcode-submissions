// [Clean]
class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let cars = zip(position,speed).sorted { $0.0 > $1.0 }
        var stack = [Double]() // time

        for (p,s) in cars {
            let distance = Double(target - p)
            let time = distance / Double(s)

            stack.append(time)
            while stack.count >= 2 && stack.last! <= stack[stack.count - 2] {
                stack.removeLast()
            }
        }
        return stack.count
    }
}
