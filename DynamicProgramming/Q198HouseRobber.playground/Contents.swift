/*
 Q198 House Robber
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.


 Example 1:

 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.


 Example 2:

 Input: [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.
 */

/*
 A normal approach to solve problem via Dynamic Programming requires two key steps:
 1. Break down to sub problems
 2. Store results of sub problems in memory array

 We will use the results of sub problems for a bigger problem until we get a solution for the whole problem.
 */

/*
 Recall the rule, we can not rob two adjacent houses, which means:
 if we think backward  [......._length-2_, _length-1_] _end_, there are two options to reach the _end_ step:
 length-2 -> end   or   length-1 -> end



 Start thinking about the extremely simple cases - the smallest sub problem
 1. input array has no element, then sum = 0
 2. input array only has one element e.g  [x] _end_ then sum = x,
 we can store this result as memo[length-1] = x

 3. input array has two element [y, x],
 we can go x -> end or y -> end, we should pick Max(x,y)
 memo[length-2] = Max(input[length-1], input[length-2])

 4. input array has three element [z, y, x]
 standing at z, we only need to check which is better? z->x->end? y->end, which means
 since we got the result for
 x->end: memo[length-1]
 y->end: memo[length-2]
 memo[length-3] = Max( (input[length-3] + memo[length-1]), memo[length-2] )

 5. now we've reached
 memo[n] = Max( (input[n] + memo[n+2]), memo[n+1] )
 the remaining thing would be making a for loop to repeat til n == 0

 Time complexity: O(n)
 Space complexity: O(n)
 */

// sample solution
func dynamicRob(input: [Int]) -> Int {
    let inputLength = input.count

    if inputLength == 0 {
        return 0
    } else if inputLength == 1 {
        return input[0]
    }

    var memo: [Int] = Array(repeating: 0, count: input.count)
    memo[inputLength-1] = input[inputLength-1]
    memo[inputLength-2] = max(input[inputLength-1], input[inputLength-2])

    if inputLength == 2 {
        return memo[inputLength-2]
    }

    for n in (0...inputLength-3).reversed() {
        memo[n] = max(input[n]+memo[n+2], memo[n+1])
    }

    return memo[0]
}

print("dynamicRob result: \(dynamicRob(input: [2,7,9,3,1]))")


/*
 Now let's try to improve the above solution:
 Hint: everytime we are at memo[n], we only care about memo[n+1] and memo[n+2], we don't need[n+3]....anymore
 So we can just use two variables instead of an array to achieve Space complexity O(1)
 */

// sample solution
func dynamicRobImproved(input: [Int]) -> Int {
    let inputLength = input.count

    if inputLength == 0 {
        return 0
    } else if inputLength == 1 {
        return input[0]
    }

    var nextNext = input[inputLength-1]
    var next = max(input[inputLength-1], input[inputLength-2])

    if inputLength == 2 {
        return next
    }

    for n in (0...inputLength-3).reversed() {
        let robCurrent = input[n] + nextNext
        let notRobCurrent = next
        let current = max(robCurrent, notRobCurrent)
        nextNext = next
        next = current
    }
    return next
}

print("dynamicRobImproved result: \(dynamicRobImproved(input: [2,7,9,3,1]))")


/* Further, we can simplify the second to the solution as below
   Hint: everytime we are at index: n, we compare which is better:
    1. rob current and rob the next next
    2. jump current and rob next
 */
func dynamicRobImprovedAndSimplified(input: [Int]) -> Int {
    var robCurrent = 0 // store sub result of n+2
    var notRobCurrent = 0 // store sub result of n+1
    for n in (0...input.count-1).reversed() {
        let robN = input[n] + robCurrent
        let subResultForN = max(robN, notRobCurrent)

        //preparing for the next turn
        robCurrent = notRobCurrent
        notRobCurrent = subResultForN
    }
    return max(robCurrent, notRobCurrent)
}

// And further simplified, 7-line solution!
func dynamicRobFurtherSimplified(input: [Int]) -> Int {
    var robCurrent = 0 // store sub result of n+2
    var notRobCurrent = 0 // store sub result of n+1
    for n in (0...input.count-1).reversed() {
        let subResultForN = max(input[n] + robCurrent, notRobCurrent)
        //preparing for the next turn
        robCurrent = notRobCurrent
        notRobCurrent = subResultForN
    }
    return max(robCurrent, notRobCurrent)
}

print("dynamicRobImproved result: \(dynamicRobImprovedAndSimplified(input: [2,7,9,3,1]))")
