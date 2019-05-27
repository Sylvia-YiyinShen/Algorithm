import Foundation

/*
 Q070. Climbing Stairs
 
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 
 Example 1:
 
 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:
 
 Input: 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 */


/*
 f(n): number of ways to go to step-n
 since every time we can climb 1 or steps
 f(n) = f(n-1) + f(n-2)
 
 we only need to variables to record
 var prePre: number of ways to go to the previous previous step, initial value is number of ways to step-1
 var pre: number of ways to go to the previous previous step, initial value is number of ways to step-2, we just go to step-2 or from step-1 to step-2
 
 */

func climbStairs(_ n: Int) -> Int {
    if n == 0 { return 1 }
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    
    var prePre = 1
    var pre = 2
    var res = 0
    for _ in 3...n {
        res = prePre + pre
        prePre = pre
        pre = res
    }

    return res
}

print(climbStairs(2))
