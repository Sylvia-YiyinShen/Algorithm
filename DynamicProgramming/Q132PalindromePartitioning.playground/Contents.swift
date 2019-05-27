import Foundation

/*
 
 Q132 Palindrome Partitioning II (Hard)
 
 
 Given a string s, partition s such that every substring of the partition is a palindrome.
 
 Return the minimum cuts needed for a palindrome partitioning of s.
 
 For example, given s = "aab",
 Return 1 since the palindrome partitioning ["aa","b"] could be produced using 1 cut.
 */


/*
 Prep work:
 isPalindrome[i][j]: a 2D array recrod is the substring(i, j) a palindrome
 
 minCuts[i]:  f(i) minimum cuts to make all substrings palindrome from f[i] - f[n-1]
 Initialize  minCuts[i] for the worst case:  f(i) = n - i - 1, means we cut every place we can
 
 Then we start backword from f[n-1] to optimise and keep updating isPalindrome[i][j] until we reach f[0] which is the final result 0 - the minimum cuts for the whole string to make all substring palindrome.
 
 Two dynamic programming happenning here
 1. isPalindrome[i][j] will reuse the result of isPalindrome[i+1][j-1]
 
 2. f(i) will reuse the result of f(i+1), f(i+2)....
 if we find isPalindrome[i][j] == true, then we have to update f(i) = min (f(i), 1 + f(j+1))
 1 + f(j+1) means: we know we can cut at j | j+1, since i-j is palindrome, so add 1 to f(j+1)
 
 a b c b d d d
 0 1 2 3 4 5 6
 
 Asume we at b (i = 1)
 bc is not palindrome, go to next step
 bcb is palindrome, update f(1) = 1 + f(4)
 bcbd is not palindrome.......
 
 O(n * n) time complexity
 
 */


extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}


func mininumCuts(string: String) -> Int {
    let stringLength = string.count
    var minCuts = [Int](repeating: 0, count: stringLength)
    for i in 0...string.count - 1 {
        minCuts[i] = string.count - 1 - i
    }
    
    var isPalindrome = [[Bool]](repeating: [Bool](repeating: false, count: stringLength), count: stringLength)
    
    for i in (0...stringLength - 1).reversed() {
        for j in i...stringLength - 1 {
            
            isPalindrome[i][j] = (string[i] == string[j]) && (j - i < 2 || isPalindrome[i+1][j-1] )
            
            
            if isPalindrome[i][j] {
                if j == stringLength - 1 {
                    minCuts[i] = min(minCuts[i], 0)
                } else {
                    minCuts[i] = min(minCuts[i], 1 + minCuts[j + 1])
                }
            }
        }
    }
    
    return minCuts[0]
}

print(mininumCuts(string: "abcbc"))
