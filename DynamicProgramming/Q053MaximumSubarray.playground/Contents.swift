import Foundation

/*
 Q053 Maximum Subarray
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Example:
 
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:
 
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 
 Start from the simplest example [-2]
 [-2] the result can only be -2
 We've got f(0) = -2
 
 Next, 2 numbers
 [-2, 1]
 for 1, the better solution would be ignore -2
 f(1) = max(num(1), num(1) + f(0))
 
 Thus, f(n): if we choose number[n], what would be the maximum sum of the contiguous subbarray ending at number[m]
 f(n) = max(num[n], num[n] + f(n -1))
 */

func maxSubArray(_ nums: [Int]) -> Int {
    if nums.count == 0 { return 0 }
    var finalResult = nums[0]
    var resultEndsAtCurrent = nums[0]
    
    for i in 1...nums.count - 1 {
        resultEndsAtCurrent = max(nums[i], nums[i] + resultEndsAtCurrent)
        finalResult = max(finalResult, resultEndsAtCurrent)
    }
    
    return finalResult
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))

