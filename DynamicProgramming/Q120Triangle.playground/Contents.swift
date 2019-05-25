import Foundation

/*
 Q120. Triangle
 
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
 
 For example, given the following triangle
 
 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]
 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).
 
 Note:
 
 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
 
 */


/*
 Solution
 
 level 1:    [2],
 level 2:   [3,4],      [3,4],
 level 3:  [6,5,7],  [7, 6, 10]
 level 4: [4,1,8,3]
 
 Think from bottom.
 When we at level 3,
 standing at 6, minimum total steps from bottom would be min(6 + 4, 6 + 1) = 7
 standing at 5, minimum total steps from bottom would be min(5 + 1, 5 + 8) = 6
 ...
 Thus, f[level][position] = f[level][position] + min(f[level + 1][position], [level + 1][position + 1])
 
 And we can just update the total steps from bottom in the array of the current level
 we can modify level 3 : [6,5,7],  -> [7, 6, 10]
 so we don't need any extra space at all.
 */

func minimumTotal(_ triangle: [[Int]]) -> Int {
    if triangle.count == 0 { return 0 }
    else if triangle[0].count == 0 { return 0}
    else if triangle.count == 1 { return triangle[0][0] }
    
    var levels = triangle
    for i in (0...levels.count - 2).reversed() {
        for j in 0...levels[i].count - 1 {
            levels[i][j] = levels[i][j] + min(levels[i+1][j], levels[i+1][j+1])
        }
        
        print(levels)
    }
    
    return levels[0][0]
}

let input = [
    [2],
    [3,4],
    [6,5,7],
    [4,1,8,3]
]


print(minimumTotal(input))
