import Foundation

/*
 
 Q064 Minimum Path Sum
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
 
 Note: You can only move either down or right at any point in time.
 
 Example:
 
 Input:
 [
 [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 
 */



/*
 Similar problem to Unique Path problem
 We can use the same approach
 The difference we store the path sum instead of the number of paths
 [i][j-1]
 |
 [i-1][j] - [i][j]
 
 minPathToPosition[i][j] = grid[i-1][j-1] + min(minPathToPosition[i - 1][j], minPathToPosition[i][j - 1])
 
 and for the first row and first column we could not use the default 0 value in the extra row/column
 We can only shift left for first row cells and only shift down for first columns cells
 */


func minPathSum(_ grid: [[Int]]) -> Int {
    if grid.count == 0 { return 0 }
    
    let numberOfRows = grid.count
    let numberOfColums = grid[0].count
    // extra 1 added to n and m means add an extra top row and left column to make calculation easier
    var minPathToPosition = [[Int]](repeating: [Int](repeating: 0, count: numberOfColums + 1), count: numberOfRows + 1)
    for i in 1...numberOfRows {
        for j in 1...numberOfColums {
            if i == 1 && j == 1 {
                minPathToPosition[1][1] = grid[0][0]
            } else if i == 1 {
                minPathToPosition[i][j] = grid[i-1][j-1] + minPathToPosition[i][j - 1]
            } else if j == 1 {
                minPathToPosition[i][j] = grid[i-1][j-1] + minPathToPosition[i - 1][j]
            } else {
                minPathToPosition[i][j] = grid[i-1][j-1] + min(minPathToPosition[i - 1][j], minPathToPosition[i][j - 1])
            }
        }
    }
    return minPathToPosition[numberOfRows][numberOfColums]
}


let grid =  [
    [1,3,1],
    [1,5,1],
    [4,2,1]
]

print(minPathSum(grid))
