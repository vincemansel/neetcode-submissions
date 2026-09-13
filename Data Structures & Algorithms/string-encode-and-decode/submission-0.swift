class Solution {

    func encode(_ strs: [String]) -> String {
        var encoder = ""
        var content = ""

        for s in strs {
            encoder += String(s.count)
            encoder += ","

            for c in s {
                content += String(c)
            }
        }

        encoder += "#"
        encoder += content

        return encoder
    }

    func decode(_ str: String) -> [String] {
        guard !str.isEmpty else { return [] }
        var counts = [Int]()
        let sArr = Array(str)
        var decoded = [String]()
        var i = 0

        while sArr[i] != "#" {
            let start = i
            while sArr[i] != "," {
                i += 1
            }
            counts.append(Int(String(sArr[start..<i]))!)
            i += 1
        }

        i += 1
        for size in counts {
            let substring = String(sArr[i..<i+size])
            decoded.append(substring)
            i += size
        }

        return decoded
    }
}
