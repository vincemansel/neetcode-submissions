// [Clean]
struct KPoint: Comparable {
    let d: Double
    let x: Int
    let y: Int

    static func <(lhs: KPoint, rhs: KPoint) -> Bool {
        return lhs.d < rhs.d
    }
}

class Solution {
    // let (squareRoot, power) = (sqrt(25.0), pow(2.0, 3.0))
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap = Heap<KPoint>()
        var output = [[Int]]()

        for p in points {
            let x = Double(p[0])
            let y = Double(p[1])
            let d = sqrt(pow(x, 2.0) + pow(y, 2.0))

            heap.insert(KPoint(d: d, x: p[0], y: p[1]))

            if heap.count > k {
                heap.popMax()
            }
        }

        while let kPoint = heap.popMin() {
            output.append([kPoint.x, kPoint.y])
        }

        return output
    }
}
