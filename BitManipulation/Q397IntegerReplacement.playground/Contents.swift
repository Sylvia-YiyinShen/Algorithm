import Foundation
/*
 
 Q397
 Integer Replacement
 
 Given a positive integer n and you can do operations as follow:
 
 If n is even, replace n with n/2.
 If n is odd, you can replace n with either n + 1 or n - 1.
 What is the minimum number of replacements needed for n to become 1?
 
 Example 1:
 
 Input:
 8
 
 Output:
 3
 
 Explanation:
 8 -> 4 -> 2 -> 1
 */

/*
 Without bit operation, you might think of a solution with time complexity of O(logN),
 since we need a loop for n/2 until n becomes 1
 
 Let's first look at the mid-results in binary number when n = 8
 
 num:    8        binary:    00001000
 num:    4        binary:    00000100
 num:    2        binary:    00000010
 num:    1        binary:    00000001
 
 if the original number takes 4 bits then it will take 4 steps
 so the problem become a shift-operation problem
 we just need >> right-shift to count the bits shifted until the number becomes 0
 and we will be able to write a O(1) solution
 */

func integerReplacement(_ n: Int) -> Int {
    if n == 1 { return 0 }
    var res = 0
    var number = n
    while number > 1 {
        if number % 2 != 0 {
            number = number - 1
        }
        res += 1
        number = number >> 1
    }
    
    return res
}

print(integerReplacement(6))
