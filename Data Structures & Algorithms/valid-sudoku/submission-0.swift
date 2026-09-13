class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = [Int: Set<Character>]()
        var cols = [Int: Set<Character>]()
        var squares = [String: Set<Character>]()

        for r in 0..<9 {
            for c in 0..<9 {

                if board[r][c] == "."  { continue }
                let key = String(r/3) + String(c/3)

                if rows[r]?.contains(board[r][c]) == true ||
                   cols[c]?.contains(board[r][c]) == true ||
                   squares[key]?.contains(board[r][c]) == true
                { return false }

                rows[r, default: []].insert(board[r][c])
                cols[c, default: []].insert(board[r][c])
                squares[key, default: []].insert(board[r][c])
            }
        }
        return true
    }
}
