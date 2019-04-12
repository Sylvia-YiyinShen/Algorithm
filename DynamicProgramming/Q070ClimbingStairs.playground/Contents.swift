/*
 70. Climbing Stairs

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
 Solution:

 Start thinking about the simpler cases
 0 step:  no way to the top, f(0) = 0
 1 step: [1] stadning at 1, one step to the top, so f(1) =1
 2 steps: [2,1]
 a. standing at 2, one step to 1, another step to the top
 b. standing at 2, two steps directly to the top
 so f(2) = 2
 3 steps: [3,2,1]
 standing at 3,
 a. we can go one step to 2, then there are f(2) ways to the top
 b. we can go two steps to 1, then there are f(1) ways to the top
 f(3) = f(2) + f(1)

 Further, for any n-step stairs, there only two options for each step
 We see f(n) = f(n-1) + f(n-2)
 */

//Sample solution
func climbStairsRecursiveSolution(numberOfStairs: Int) -> Int {
    if numberOfStairs == 0 { return 0 }
    else if numberOfStairs == 1 { return 1 }
    else if numberOfStairs == 2 { return 2 }
    else {
        return climbStairsRecursiveSolution(numberOfStairs: numberOfStairs-1) + climbStairsRecursiveSolution(numberOfStairs: numberOfStairs-2)
    }
}
print("climbStairsRecursiveSolution result: \(climbStairsRecursiveSolution(numberOfStairs: 5))")

/*
 It's easy to write a recursive solution as above, but recursive function is slower than iteration and requires more memory.

 Better solution: Dynamic Programming

 The reason why Dynamic Programming is better than recursive is
 1. In recursive solution, we start thinking from the biggest f(n), which means solving f(0) and f(1) we need the memory for f(n), f(n-1).... f(2)
 1. In Dynamic Programming, we think backward, solve a small problem, save result the small problem and use the result for a bigger problem. In other words, we only need the memory for the current problem we are solving.
 */

//Sample solution
func climbStairsDynamicSolution(numberOfStairs: Int) -> Int {
    if numberOfStairs == 0 { return 0 }
    else if numberOfStairs == 1 { return 1 }
    else if numberOfStairs == 2 { return 2 }
    else {
        // an array to store result for each step will require O(n) Space
        // since when we only need f(n-1) and f(n-2) to solve f(n), 2 variables will be enough
        var waysFromNextStep = 2 // f(n-1)
        var waysFromNextNextStep = 1 // f(n-2)
        for n in (3...numberOfStairs).reversed() {
            let waysFromStepN = waysFromNextStep + waysFromNextNextStep
            waysFromNextNextStep = waysFromNextStep
            waysFromNextStep = waysFromStepN
        }

        return waysFromNextStep
    }
}

print("climbStairsDynamicSolution result: \(climbStairsDynamicSolution(numberOfStairs: 5))")


