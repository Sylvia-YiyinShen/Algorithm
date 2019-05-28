import Foundation

/*

 Q055 Jump Game

 Given an array of non-negative integers, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Determine if you are able to reach the last index.

 Example 1:

 Input: [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum
 jump length is 0, which makes it impossible to reach the last index.

 */

/*
 maxReach = max(maxReach, nums[i] + i)

 Traverse once and check what is the max step we can go for each step, we record it as maxReach
 Also check if the current position is reachable from any previous step by comparing nums[i] and maxReach
 */

func canJump(_ nums: [Int]) -> Bool {
    if nums.count == 0 { return false }
    var maxReach = 0 // maxReach at index i

    for i in 0...nums.count - 1 {
        if i > maxReach { break }
        maxReach = max(maxReach, nums[i] + i)
    }

    if maxReach < nums.count - 1 {
        return false
    } else {
        return true
    }
}

print(canJump([3,2,1,0,4]))
print(canJump([2,3,1,1,4]))
