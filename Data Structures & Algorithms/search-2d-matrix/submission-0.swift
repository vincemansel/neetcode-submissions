class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var index = 0
        for i in 0..<m {
            if target <= matrix[i].last! {
                index = i
                break
            }
        }

        var l = 0
        var r = n-1

        while l <= r {
            let mid = l + (r - l)/2
            if matrix[index][mid] == target {
                return true
            }
            else if matrix[index][mid] < target {
                l = mid + 1
            }
            else {
                r = mid - 1
            }
        }
        return false
    }
}
