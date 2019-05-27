import Foundation

/*
 
 Q303. Range Sum Query - Immutable

 Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.
 
 Example:
 Given nums = [-2, 0, 3, -5, 2, -1]
 
 sumRange(0, 2) -> 1
 sumRange(2, 5) -> -1
 sumRange(0, 5) -> -3
 
 Note:
 You may assume that the array does not change.
 There are many calls to sumRange function.

 */


/*
  Since the sumRange will be called many times
  We should think a way that to reuse the sums
 
  This apprach only travers the array once and store sum of 0th to n-th
  Input  [-2, 0, 3, -5, 2, -1]
  Record [-2, -2, 1, -4, -2, -3]
 
   sumRange(i,j) = sum[j] - sum[i - 1]
 
 */

class NumArray {
    var sums: [Int]
    init(_ nums: [Int]) {
        sums = [Int](repeating: 0, count: nums.count + 1) // extra start num
        for i in 1...nums.count {
            sums[i] = sums[i - 1] + nums[i]
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        // sumRange(i,j) = sum[j] - sum[i - 1] is correct
        // but we've added extra start num, so have to shift index right
        return sums[j + 1] - sums[i]
    }
}
