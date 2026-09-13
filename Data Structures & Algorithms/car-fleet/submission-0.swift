class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var fleets = 0
        let n = speed.count
        
        var pSpeed = [(Int,Int)]()

        for i in 0..<n {
            pSpeed.append((position[i], speed[i]))
        }

        pSpeed.sort { $0.0 > $1.0 }

        var stack = [Double]()

        for (p,s) in pSpeed {
            let distance = Double(target - p)
            let time = distance/Double(s)
            stack.append(time)
            if stack.count >= 2 && stack.last! <= stack[stack.count - 2] {
                stack.removeLast()
            }
        }
        
        return stack.count
    }
}
