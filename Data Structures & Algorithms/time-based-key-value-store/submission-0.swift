class TimeMap {

    var store = [String:[(String,Int)]]()

    init() {

    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((value,timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        if let valueArray = store[key] { // [(value, timestamp)]
            if valueArray.last!.1 == timestamp {
                return valueArray.last!.0
            }
            else {
                // binarySearch for largest timestamp_prev <= timestamp
                return binarySearch(valueArray, timestamp)
            }
        }
        
        return ""
    }

    private func binarySearch(_ valueArray: [(String,Int)], _ timestamp: Int) -> String {

        var l = 0, r = valueArray.count - 1
        var res = ""

        while l <= r {
            let m = (l + r)/2

            if valueArray[m].1 == timestamp {
                return valueArray[m].0
            }
            else if valueArray[m].1 < timestamp {
                l = m + 1
                res = valueArray[m].0
            }
            else {
                r = m - 1
            }
        }

        return res
    }
}
