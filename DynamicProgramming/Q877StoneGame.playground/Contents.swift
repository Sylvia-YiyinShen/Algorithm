import Foundation

/*
 Q877. Stone Game
 
 Alex and Lee play a game with piles of stones.  There are an even number of piles arranged in a row, and each pile has a positive integer number of stones piles[i].
 
 The objective of the game is to end with the most stones.  The total number of stones is odd, so there are no ties.
 
 Alex and Lee take turns, with Alex starting first.  Each turn, a player takes the entire pile of stones from either the beginning or the end of the row.  This continues until there are no more piles left, at which point the person with the most stones wins.
 
 Assuming Alex and Lee play optimally, return True if and only if Alex wins the game.
 
 
 
 Example 1:
 
 Input: [5,3,4,5]
 Output: true
 Explanation:
 Alex starts first, and can only take the first 5 or the last 5.
 Say he takes the first 5, so that the row becomes [3, 4, 5].
 If Lee takes 3, then the board is [4, 5], and Alex takes 5 to win with 10 points.
 If Lee takes the last 5, then the board is [3, 4], and Alex takes 4 to win with 9 points.
 This demonstrated that taking the first 5 was a winning move for Alex, so we return true.
 
 
 Note:
 
 2 <= piles.length <= 500
 piles.length is even.
 1 <= piles[i] <= 500
 sum(piles) is odd.
 */


/*
 Interestly, the first player can always have the control to collect all the numer at the even index or odd index. If the sum of nums at even index is greater then sum of odd index, then just select sum of even index.
 
 Is that true the first player always has the control?
 [4, 3, 1, 7, 2, 1]
 Assume I am the first player and I found 4 + 1 + 2 < 3 + 7 + 1
 The question now becomes can I get  3, 7, 1
 YES, I can choose the last 1 first, the next player could choose 4 or 2 from [4, 3, 1, 7, 2]
 If he chooses 4 then I choose 3
 If he chooses 2 then i choose 7
 
 So the first player always wins.
 */

func stoneGame(_ piles: [Int]) -> Bool {
    return true
}
