import Foundation
/*
 Q005. Longest Palindromic Substring
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example 1:
 
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 Example 2:
 
 Input: "cbbd"
 Output: "bb"
 */

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript(range: ClosedRange<Int>) -> String {
        return String(self[index(startIndex, offsetBy: range.lowerBound)...index(startIndex, offsetBy: range.upperBound)])
    }
}

/*
 defines f(i...j): string[i...j] is palindrome or not
 if i == j, we are checking ''
 or j - i == 1  'a', j - i == 2, 'aa', just need to make sure stirng[i] ==  string[j]
 j - i > 2, we have to check if stirng[i] ==  string[j] and f[i+1...j-1]
 
 f(i...j) = string[i] ==  string[j]  && (j - i < 3 || f(i+1...j-1))
 So we need a 2D array to store results of sub problems
 
 */


/* Java solution
 
 class Solution {
 public String longestPalindrome(String s) {
 if (s.length() == 0) { return ""; }
 
 int n = s.length();
 String res = null;
 
 boolean[][] dp = new boolean[n][n];
 
 for (int i = n - 1; i >= 0; i--) {
 for (int j = i; j < n; j++) {
 dp[i][j] = s.charAt(i) == s.charAt(j) && (j - i < 3 || dp[i + 1][j - 1]);
 
 if (dp[i][j] && (res == null || j - i + 1 > res.length())) {
 res = s.substring(i, j + 1);
 }
 }
 }
 return res;
 }
 
 }
 */


func longestPalindrome(_ s: String) -> String {
    if s.count == 0 { return "" }
    
    let length = s.count
    var results = ""
    var memo = [[Bool]](repeating: [Bool](repeating: false, count: length), count: length)
    
    for i in (0...length - 1).reversed() {
        for j in i...length - 1 {
            memo[i][j] = (s[i] == s[j]) && (j - i < 3 || memo[i + 1][j - 1])
            if memo[i][j] && (results == "" || j - i + 1 > results.count) {
                results = s[i...j]
            }
        }
    }
    
    return results
}

print("result: \(longestPalindrome("abcbaa"))")
