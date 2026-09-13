class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var pairs = zip(position, speed).map { ($0, $1) }

        pairs.sort { $0.0 > $1.0 }

        var fleet = 0
        var recent = 0.0

        for (p,s) in pairs {
            let time = Double(target - p)/Double(s)
            if time > recent {
                fleet += 1
                recent = time
            }
            
        }

        return fleet
    }
}
