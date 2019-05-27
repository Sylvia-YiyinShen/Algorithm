import Foundation

/*
 Q063. Unique Paths II Unique Paths II

 Follow up for "Unique Paths":
 
 Now consider if some obstacles are added to the grids. How many unique paths would there be?
 
 An obstacle and empty space is marked as 1 and 0 respectively in the grid.
 
 For example,
 
 There is one obstacle in the middle of a 3x3 grid as illustrated below.
 
 [
 [0,0,0],
 [0,1,0],
 [0,0,0]
 ]
 The total number of unique paths is 2.
 */

/*
 The only difference compared to Q060
 
 for those positions obstacle[i][j] == 1 has an obstacle, there is no path to go there, so we should put pathsToPosition[i][j] == 0
 
 */

let obstacleGrid =  [
    [0,0,0],
    [0,1,0],
    [0,0,0]
]


func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    if obstacleGrid.count == 0 { return 0 }
    
    let numberOfRows = obstacleGrid.count
    let numberOfColums = obstacleGrid[0].count
    // extra 1 added to n and m means add an extra top row and left column to make calculation easier
   var pathsToPosition = [[Int]](repeating: [Int](repeating: 0, count: numberOfColums + 1), count: numberOfRows + 1)
    print(pathsToPosition)
    
    for i in 1...numberOfRows {
        for j in 1...numberOfColums {
            if obstacleGrid[i-1][j-1] == 1 {
                pathsToPosition[i][j] = 0
            } else if i == 1 && j == 1 {
                pathsToPosition[1][1] = 1
            } else {
                pathsToPosition[i][j] = pathsToPosition[i - 1][j] + pathsToPosition[i][j - 1]
            }
        }
    }
    
    return pathsToPosition[numberOfRows][numberOfColums]
}

print("unique paths: \(uniquePathsWithObstacles(obstacleGrid))")
