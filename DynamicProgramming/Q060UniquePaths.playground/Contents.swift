import Foundation

/*
 Q060 Unique paths
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 How many possible unique paths are there?
 */

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    if m == 0 && n == 0 { return 0 }
    if m == 1 || n == 1 { return 1 }
    
    // extra 1 added to n and m means add an extra top row and left column to make calculation easier
    var pathsToPosition = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
    
    for i in 1...m {
        for j in 1...n {
            if i == 1 && j == 1 {
                pathsToPosition[1][1] = 1
            } else {
                pathsToPosition[i][j] = pathsToPosition[i - 1][j] + pathsToPosition[i][j - 1]
            }
        }
    }
    return pathsToPosition[m][n]
}

print("unique paths: \(uniquePaths(4, 4))")
