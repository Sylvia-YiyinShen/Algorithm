import Foundation

/*
 Q1025 Diviser Game
 
 Alice and Bob take turns playing a game, with Alice starting first.
 
 Initially, there is a number N on the chalkboard.  On each player's turn, that player makes a move consisting of:
 
 Choosing any x with 0 < x < N and N % x == 0.
 Replacing the number N on the chalkboard with N - x.
 Also, if a player cannot make a move, they lose the game.
 
 Return True if and only if Alice wins the game, assuming both players play optimally.
 
 
 Example 1:
 
 Input: 2
 Output: true
 Explanation: Alice chooses 1, and Bob has no more moves.
 
 
 Example 2:
 
 Input: 3
 Output: false
 Explanation: Alice chooses 1, Bob chooses 1, and Alice has no more moves.
 
 
 Note:
 
 1 <= N <= 1000
 */


/*  0  1  2  3  4  5  6  7  8  9     16 17 18
  |  |  |  |  |  |  |  |  /  /  |
 
 0 < x < N, replace x with N - x, Alice always starts first
 
 N = 0 or N = 1, no one is able to play this game
 N = 2, Alice: 1, make the problem as f(N = 1) = false for Bob, Alice wins
 N = 3, Alice can only choose 1, make the problem as f(N = 2) == true, Alice lose
 N = 4, Alice can choose 1 or 2, to make the problem as f(N = 3) or f(N = 2), apparently Alice should choose 1 to win
 N = 5, Alice can only choose 1, f(N = 4) bob win
 .......
 seems there is a pattern, for even number Alice can always win but not odd (Actually, that is true)
 
 N = 12, 1? Yes, Alice wins
         2?  f(N = 10) for bob to win
         3?  f(N = 9)  for bob, Alice will win
 N = 15  1? Yes
         3? f(12) bob will win
         5? f(10) bob will win
 .....
 
 Findings;
 1. If Alice got a even number, she can alwasy pass back a odd number to bob
 2. If Alice got a odd number, divider can only be odd number, odd - odd = even
 
 For any N, finally we will always go back to f(2) f(3)
 Starting from a odd number, Alice can only pass f(even) to Bob
 Starting from a even number, Alice can always get f(2) to herself
 
 Win or not just depends on the number is even or odd.
 
 Pretty strait forward solution is just : return N % 2 == 0
 
 */


func divisorGame(_ N: Int) -> Bool {
    if N < 2 { return false }
    
    var results = [Bool](repeating: false, count: N + 1)
    results[2] = true
    results[3] = false
    results[4] = true
    if N > 4 {
        for i in 4...N {
            print(i)
            results[i] = results[i - 2]
        }
    }
    return results[N]
}

print(divisorGame(20))
