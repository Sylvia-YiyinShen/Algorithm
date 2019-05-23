/*
 Q078. Subsets
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: nums = [1,2,3]
 Output:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 
 Solution:
 
 Given a list contains n distinct character
 The number of all possible subsets is 2 to the power of n
 
 Take ["A","B","C","D"] as an example and if we use binary number to represent the subset
 1 means subset contains that element
 0 means subset doesn't contain that element
 
 We will have
 0000 as []
 1000 as ["A"]
 1001 as ["A", "D"]
 1111 as ["A","B","C","D"]
 ....
 
 Then we will be able to convert the binary number to the subset via bitwise operations '&' and '>>'.
 We can start checking the last bit in the binary number and deciding if that element can be put into the subset. Then shift right to check the next last bit.
 
 The range needs to be checked is 0 to 2^n - 1
 */
import Foundation

func allSubsets(of list: [String]) -> [[String]] {
    let numberOfSubsets = Int(truncating: pow(Decimal(list.count), 2) as NSDecimalNumber)
    var subsets: [[String]] = []
    for i in 0...numberOfSubsets - 1 {
        var n = i
        var subset: [String] = []
        for index in (0...list.count - 1).reversed() {
            if n & 1 == 1 {
                subset.insert(list[index], at: 0)
            }
            n = n >> 1
        }
        subsets.append(subset)
    }
    return subsets
}


print(allSubsets(of: ["A", "B", "C", "D"]))
