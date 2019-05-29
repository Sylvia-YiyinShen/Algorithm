import Foundation

/*
 Q189. Rotate Array
 
 Given an array, rotate the array to the right by k steps, where k is non-negative.
 
 Example 1:
 
 Input: [1,2,3,4,5,6,7] and k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:
 
 Input: [-1,-100,3,99] and k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 Note:
 
 Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 */

/*
 Solution: Reversing
 
 If we have an array as blow and k = 3
 1, 2, 3, 4, 5, 6
 Reverse the whole array and we get
 6, 5, 4, 3, 2, 1
 Reverse the first k element
 4, 5, 6, 3, 2, 1
 Reverse the elements from k+1 ~ n
 4, 5, 6, 1, 2, 3 this is what we are expecting
 
 */

func reverse(_ nums: inout [Int], start: Int, end: Int) {
    var left = start
    var right = end
    while left <= right {
        let temp = nums[left]
        nums[left] = nums[right]
        nums[right] = temp
        left += 1
        right -= 1
    }
}

func rotate(_ nums: inout [Int], _ k: Int) {
    let steps = k % nums.count
    reverse(&nums, start: 0, end: nums.count - 1)
    reverse(&nums, start: 0, end: steps - 1)
    reverse(&nums, start: steps, end: nums.count - 1)
}

var array = [1, 2, 3, 4, 5, 6, 7]
rotate(&array, 3)

