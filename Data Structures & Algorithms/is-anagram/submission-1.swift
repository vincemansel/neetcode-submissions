class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        let sSorted = s.sorted()
        let tSorted = t.sorted()

        return sSorted == tSorted
    }
}
