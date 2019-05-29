import Foundation

/*
 Q015. 3Sum
 
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note:
 
 The solution set must not contain duplicate triplets.
 
 Example:
 
 Given array nums = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 */

/*
 Similar to two sum if sort the array first
 Requires one more loop on the sorted array
 Check for every num in the array, can we find two sum that equals to - num
 
 Tricks:
 remove the duplicate target num, by checking if the previous == num  continue
 remove the duplicate left/right point, by shifting until find a different one from the previous
 */

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 { return [] }
    
    var res: [[Int]] = []
    var numbers = nums
    numbers.sort()
    
    for i in 0...numbers.count - 1 {
        if i > 0 && numbers[i] == numbers[i - 1] { continue } // remove duplicates
        
        var left = i + 1
        var right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right] + numbers[i]
            if sum == 0 {
                let triple = [numbers[i], numbers[left], numbers[right]]
                res.append(triple)
                while left < right && numbers[right] == numbers[right - 1] { // remove duplicates
                    right -= 1
                }
                while left < right && numbers[left] == numbers[left + 1] { // remove duplicates
                    left += 1
                }
                left += 1
            } else if sum > 0 {
                right -= 1
            } else {
                left += 1
            }
        }
    }
    
    return res
}

print(threeSum([-1, 0, 1, 2, -1, -4]))
