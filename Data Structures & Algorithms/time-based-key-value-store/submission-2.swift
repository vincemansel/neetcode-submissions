// [Issue][time] 24 minutes to solution
class TimeMap {
    var cache: [String:[(Int,String)]] = [:]
    init() {}

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        cache[key, default: []].append((timestamp, value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        if let arr = cache[key] {
            var lastTime = -1
            for i in stride(from: arr.count-1, through: 0, by: -1) {
                let (valTime, val) = arr[i]
                if valTime <= timestamp {
                    return val
                }
            }
        }
        return ""
    }
}
