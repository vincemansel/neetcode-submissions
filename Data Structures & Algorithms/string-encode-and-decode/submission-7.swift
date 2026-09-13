class Solution {

    func encode(_ strs: [String]) -> String {
        // length#string
        var output = ""

        for s in strs {
            output += String(s.count) + "#" + s
        }

        return output
    }

    func decode(_ str: String) -> [String] {
        let s = Array(str)
        var output = [String]()

        var r = 0
        while r < s.count {
            var countString = ""
            var count = 0
            while s[r] != "#" {
                countString += String(s[r])
                r += 1
            }
            count = Int(countString)!
            r += 1
            let word = String(s[r..<r+count])
            output.append(word)
            r += count
        }

        return output
    }
}
