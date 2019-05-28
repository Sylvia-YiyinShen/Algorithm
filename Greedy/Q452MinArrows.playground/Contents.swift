import Foundation

/*
 Q452. Minimum Number of Arrows to Burst Balloons (Medium)

 There are a number of spherical balloons spread in two-dimensional space. For each balloon, provided input is the start and end coordinates of the horizontal diameter. Since it's horizontal, y-coordinates don't matter and hence the x-coordinates of start and end of the diameter suffice. Start is always smaller than end. There will be at most 104 balloons.

 An arrow can be shot up exactly vertically from different points along the x-axis. A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend. There is no limit to the number of arrows that can be shot. An arrow once shot keeps travelling up infinitely. The problem is to find the minimum number of arrows that must be shot to burst all balloons.

 Example:

 Input:
 [[10,16], [2,8], [1,6], [7,12]]

 Output:
 2

 Explanation:
 One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6]) and another arrow at x = 11 (bursting the other two balloons).

 */


/*
 1. Sort by start point then end point, we might get the sorted ballons as below
        ---------
          ------
             ---------
                   ------
                   ---------
 2. In order to sort as more balloons as possible, try to shot at the end point
 starting at the endpoint of ballon 1, record it as the arrow
 check the next ballon, if we find the start point is smaller than arrow which means we can try to adjust the arrow to shot it by this arrow, by min(endpoint, arrow)
 (In the above example, the first shot would be at the end point of 2th balloon, at shot 1,2,3 together, since the start point of 4th is greater than the arrow. So once we shot 1-3, we have to do another shot for the 4th, update the count.)

 And we have to repeat the above steps from 4th balloon, assume the next shot is at endpoint of 4th

 */


func findMinArrowShots(_ points: [[Int]]) -> Int {
    if points.count == 0 { return 0 }

    var balloons = points
    balloons.sort { (b1, b2) -> Bool in
        /* sort by start point then end point
         [10,16], [2,8], [1,6], [7,12] will be sorted as
         [1, 6], [2, 8], [7, 12], [10, 16]
         */
        if b1[0] != b2[0] {
            return b1[0] < b2[0]
        } else {
            return b2[0] > b1[0]
        }
    }

    var countArrow = 1
    var arrowX = balloons[0][1]

    for balloon in balloons {
        if balloon[0] <= arrowX {
            arrowX = min(arrowX, balloon[1])
        } else {
            countArrow += 1
            arrowX = balloon[1]
        }
    }

    return countArrow
}

print(findMinArrowShots([[10,16], [2,8], [1,6], [7,12]]))
