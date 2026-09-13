class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let ROWS = matrix.count
        let COLS = matrix[0].count

        var l = 0, r = ROWS * COLS - 1

        while l <= r {
            let mid = l + (r - l)/2
            let row = mid / COLS
            let col = mid % COLS

            if matrix[row][col] == target {
                return true
            }
            else if target > matrix[row][col]  {
                l = mid + 1
            }
            else {
                r = mid - 1
            }
        }
        return false
    }
}
