class Solution {

    // func encode(_ strs: [String]) -> String {
    //     // length#content
    //     var encoder = ""

    //     for s in strs {
    //         let len = s.count
    //         if len == 100 {
    //             encoder += "1"
    //         }
    //         let ones = (len % 10) 
    //         let tens = (len - ones) % 100
    //         if tens > 0 {
    //             encoder += String(tens)
    //         }
    //         encoder += String(ones)
    //         encoder += "#"
    //         encoder += s
    //     }

    //     return encoder
    // }

    func encode(_ strs: [String]) -> String {
        var res: [String] = []
        //res.reserveCapacity(strs.count * 3)
        for s in strs {
            res.append(String(s.count))
            res.append("#")
            res.append(s)
        }
        return res.joined()
    }

    // func decode(_ str: String) -> [String] {
    //     let sArr = Array(str)
    //     var decoder = [String]()
    //     var i = 0

    //     while i < sArr.count {
    //         var len = 0
    //         var mult = 1
    //         while sArr[i] != "#" {
    //             len = mult * Int(String(sArr[i]))!
    //             mult *= 10
    //             i += 1
    //         }
    //         i += 1
    //         let substring = String(sArr[i..<i+len])
    //         decoder.append(substring)
    //         i += len
    //     }

    //     return decoder
    // }

    func decode(_ s: String) -> [String] {
        var res = [String]()
        let sArr = Array(s)
        var i = 0

        while i < sArr.count {
            var j = i
            while sArr[j] != "#" {
                j += 1
            }
            let lengthStr = String(sArr[i..<j])
            let length = Int(lengthStr)!

            i = j + 1
            let end = i + length
            let substring = String(sArr[i..<end])
            res.append(substring)
            i = end
        }

        return res
    }
}
