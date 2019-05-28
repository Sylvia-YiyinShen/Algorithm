import Foundation

/*
 Q045. Jump Game II hard
 
 Given an array of non-negative integers, you are initially positioned at the first index of the array.
 
 Each element in the array represents your maximum jump length at that position.
 
 Your goal is to reach the last index in the minimum number of jumps.
 
 Example:
 
 Input: [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2.
 Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Note:
 
 You can assume that you can always reach the last index.
 
 */

/*
 We have to reach the last index with minimum jumps, so we should jump at the step with the largest number if possible
 Let's take [2,3,1,5,4] as example
 [2,3,1,1,4]
 intdex  0 1 2 3 4
 
 var countJump = 0
 var maxReach = 0
 var prevReach = 0
 
 1. we have to jump at the nums[0]: 2, the maximum index we can reach is 2, maxReach = 2
 2. check index = 1, this is the place we have to jump
 if index > prevReach, we increase：countJump = 1,
 every time we jump update the prevReach = maxReach = 2
 maxReach = 1 + 3 = 4
 3. check index = 2, maxReach = max(maxReach, 2+1) = 4
 4. check index = 3, greater than prevReach, means this is the place we only can reach by jump, so just like step 2
 countJump = 2, prevReach = 4
 maxReach = max(4, 4) = 4
 5. check index = 4, <= maxReach
 maxReach = max(4, 4+4) = 8
 6. loop ends
 
 */

func jump(_ nums: [Int]) -> Int {
    if nums.count == 0 { return 0 }
    
    var countJump = 0
    var maxReach = 0
    var prevReach = 0
    
    for i in 0...nums.count - 1 {
        if i > prevReach {
            countJump += 1
            prevReach = maxReach
        }
        maxReach = max(maxReach, i + nums[i])
    }
    
    return countJump
}

print(jump([2,3,1,1,4]))

