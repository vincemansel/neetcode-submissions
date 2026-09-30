// [Hint][lang] - typo: separator not "seperator" >> return output.joined(seperator: "")
// [Hint][lang] - optional unwrap in wrong place >> Int(String(s[r..<len])!)
class Solution {

    func encode(_ strs: [String]) -> String {
        // length#word
        var output = [String]()
        for s in strs {
            let count = String(s.count)
            output.append("\(count)#\(s)")
        }
        return output.joined(separator: "")
    }

    func decode(_ str: String) -> [String] {
        var output = [String]()
        var r = 0
        let s = Array(str)

        while r < s.count {
            var len = r
            while s[len] != "#" {
                len += 1
            }
            let count = Int(String(s[r..<len]))!
            r = len + 1
            let end = r + count
            let word = String(s[r..<end])
            output.append(word)
            r = end
        }

        return output
    }
}
