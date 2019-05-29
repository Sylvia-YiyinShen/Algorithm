import Foundation


/*
 Q167. Two Sum II - Input array is sorted
 
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
 
 Note:
 
 Your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 Example:
 
 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
 
 */

/*
 Two-pointer solution
 l = 0, r = nums.count - 1,
 check the sum of left and right
 if sum > target, shift r left to try to find a smaller sum
 if sum < target , shift l right to try to find a greater sum
 Until find a sum == target, or no such sum could be found in nums
 
 */

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    while left < right {
        let sum = numbers[left] + numbers[right]
        if sum > target {
            right -= 1
        } else if sum < target {
            left += 1
        }
        return [left, right]
    }
    
    return []
}
