import Foundation

/*
 Q455. Assign Cookies
 Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie. Each child i has a greed factor gi, which is the minimum size of a cookie that the child will be content with; and each cookie j has a size sj. If sj >= gi, we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.
 
 Note:
 You may assume the greed factor is always positive.
 You cannot assign more than one cookie to one child.
 
 Example 1:
 Input: [1,2,3], [1,1]
 
 Output: 1
 
 Explanation: You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3.
 And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
 You need to output 1.
 Example 2:
 Input: [1,2], [1,2,3]
 
 Output: 2
 
 Explanation: You have 2 children and 3 cookies. The greed factors of 2 children are 1, 2.
 You have 3 cookies and their sizes are big enough to gratify all of the children,
 You need to output 2.
 
 */

/*
 Always try to assign the largest cookie to the greediest child if you can
 So we have to sort children and cookies first
 If the largest cookie still could not make that child happy, then look at the less greedy child
 */

func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    var countAssignment = 0
    var children = g.sorted { (a, b) -> Bool in
        return a > b
    }
    var cookies = s.sorted { (a, b) -> Bool in
        return a > b
    }
    
    var childIndex = 0
    var cookieIndex = 0
    while childIndex < children.count && cookieIndex < cookies.count {
        if cookies[cookieIndex] >= children[childIndex] {
            countAssignment += 1
            childIndex += 1
            cookieIndex += 1
        } else {
            childIndex += 1
        }
    }
    return countAssignment
}

print(findContentChildren([1,2,3], [1, 2]))

