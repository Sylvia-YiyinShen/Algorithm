import Foundation
/*
 Q011 Container With Most Water
 
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 
 Note: You may not slant the container and n is at least 2.
 
 
 
 */

/*
 Brute Force is O(n * n) time complexity
 Using two pointers to improve, the trick is how to move the pointers and make sure in the way we will not miss the possibility of getting max area
 i = 0, j = height.count, move i right and j left
 We always move the shorter point ,since the area is determined by the width and the shorter line
 When move i right or j left, we are decreasing the width
 And height is determined by shorter line, if move the longer point we are not able to find a better result.
 So move the shorter point until find one that is longer than another pointer, calculate the area
 */


func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    var left = 0
    var right = height.count - 1
    while left < right {
        maxArea = max(maxArea, (right - left) * min(height[right], height[left]))
        if height[i] < height[j] {
            i += 1
        } else {
            j -= 1
        }
    }
    
    return maxArea
}

