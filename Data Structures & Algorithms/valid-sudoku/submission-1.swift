class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = [Int](repeating: 0, count: 9)
        var cols = [Int](repeating: 0, count: 9)
        var squares = [Int](repeating: 0, count: 9)

        for r in 0..<9 {
            for c in 0..<9 {
                if board[r][c] == "." { continue }

                let val = Int(board[r][c].asciiValue! - Character("0").asciiValue!)
                let bitmask = 1 << (val - 1)

                if (rows[r] & bitmask) != 0 { return false }
                if (cols[c] & bitmask) != 0 { return false }
                let sKey = (r/3) * 3 + (c/3)
                if (squares[sKey] & bitmask) != 0 { return false }

                rows[r] |= bitmask
                cols[c] |= bitmask
                squares[sKey] |= bitmask
            }
        }

        return true
    }
}
