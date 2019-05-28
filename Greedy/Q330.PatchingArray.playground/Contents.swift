import Foundation

/*
 Q330. Patching Array (Hard)

 Description
 Given a sorted positive integer array nums and an integer n, add/patch elements to the array such that any number in range [1, n] inclusive can be formed by the sum of some elements in the array. Return the minimum number of patches required.

 Example 1:
 nums = [1, 3], n = 6
 Return 1.

 Combinations of nums are [1], [3], [1,3], which form possible sums of: 1, 3, 4.
 Now if we add/patch 2 to nums, the combinations are: [1], [2], [3], [1,3], [2,3], [1,2,3].
 Possible sums are 1, 2, 3, 4, 5, 6, which now covers the range [1, 6].
 So we only need 1 patch.

 Example 2:
 nums = [1, 5, 10], n = 20
 Return 2.
 The two patches can be [2, 4].

 Example 3:
 nums = [1, 2, 2], n = 5
 Return 0.





 We have to check every number from 1 ~ n      miss: Int
 We should keep an index pointer to record if we have checked all the number within the array  index:Int

 We have to loop until miss == n
 Everytime we should compare if all the elements have been used

 If not all used
 Then compare if miss >= nums[index]
 YES: we've covered [1, miss - 1], since nums[index] is also smaller that miss, the whole range has been covered is [1, miss - 1 + nums[index]], we can update miss
 NO:  have to insert miss, [1, miss * 2 - 1] will be covered by the sum of the elements in array, so update miss = miss * 2


 If all used: insert miss then, [1, miss * 2 - 1] will be covered by the sum of the elements in array, so update miss = miss * 2

 */

func minPatches(_ nums: [Int], _ n: Int) -> Int {
    var countPatches = 0
    var miss = 1
    var index = 0

    while miss <= n {
        if index < nums.count && miss >= nums[index] {
            miss += nums[index]
            index += 1
        } else {
            // insert miss
            countPatches += 1
            miss = miss * 2
        }
    }
    return countPatches
}


print(minPatches([1, 3], 6)) // should return 1
print(minPatches([1, 5, 10], 20)) // should return 2
print(minPatches([1, 2, 2], 5)) // should return 0
