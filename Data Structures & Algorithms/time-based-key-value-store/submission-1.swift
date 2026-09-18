class TimeMap {
    var store: [String:[(Int,String)]] = [:]

    init() {}

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((timestamp,value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        if let timestore = store[key] {
            for i in stride(from: timestore.count-1, through: 0, by: -1) {
                if timestore[i].0 <= timestamp {
                    return timestore[i].1
                }
            }
        } 
        return ""
    }
}
