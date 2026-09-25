class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // If s1 is longer than s2, return false.
        guard s1.count <= s2.count else { return false }

        // Build character frequency arrays for:
        // - s1
        // - the first window of s2 of size len(s1)

        var s1count = [Int](repeating: 0, count: 26)
        var s2count = [Int](repeating: 0, count: 26)
        let base = Int(Character("a").asciiValue!)

        let s1 = Array(s1)
        let s2 = Array(s2)

        for i in 0..<s1.count {
            s1count[Int(s1[i].asciiValue!) - base] += 1
            s2count[Int(s2[i].asciiValue!) - base] += 1
        }

        // Count how many positions match between the two arrays (matches).

        var matches = 0
        for i in 0..<26 {
            matches += (s1count[i] == s2count[i]) ? 1 : 0
        }

        // Slide the window from left to right across s2:
        var l = 0

        for r in s1.count..<s2.count {
            // - If at any time matches == 26, return true.
            if matches == 26 {
                return true
            }

            // - At each step, add the new right character and update counts/matches
            var index = Int(s2[r].asciiValue!) - base
            s2count[index] += 1
            matches += (s1count[index] == s2count[index]) ? 1 : 0
            matches -= (s1count[index] + 1 == s2count[index]) ? 1 : 0

            // - Remove the left character and update counts/matches.

            index = Int(s2[l].asciiValue!) - base
            s2count[index] -= 1
            matches += (s1count[index] == s2count[index]) ? 1 : 0
            matches -= (s1count[index] - 1 == s2count[index]) ? 1 : 0

            l += 1
        }
        // After finishing the loop, return whether matches == 26.

        return matches == 26

    }
}
