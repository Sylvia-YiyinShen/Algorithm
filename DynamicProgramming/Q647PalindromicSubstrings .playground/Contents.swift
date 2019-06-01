import Foundation

/*
 Q647. Palindromic Substrings
 
 Given a string, your task is to count how many palindromic substrings in this string.
 
 The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.
 
 Example 1:
 
 Input: "abc"
 Output: 3
 Explanation: Three palindromic strings: "a", "b", "c".
 
 
 Example 2:
 
 Input: "aaa"
 Output: 6
 Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
 
 
 Note:
 
 The input string length won't exceed 1000.
 */


/*
 Palindromic problem basically can be solved with 2D array and dynamica programming
 Since we want to reuse the result for sub problems intead of repeative calculation
 */


func countSubstrings(_ s: String) -> Int {
    var countPalindrome = 0
    let length = s.count
    var characters = [Character](s)
    var isPalindrome = [[Bool]](repeating: [Bool](repeating: false, count: length), count: length)
    
    for (start, char) in characters.enumerated().reversed() {
        for end in start...length - 1 {
            isPalindrome[start][end] = (char == characters[end]) && (end - start < 3 || isPalindrome[start + 1][end - 1])
            if isPalindrome[start][end] {
                countPalindrome += 1
            }
        }
    }
    
    return countPalindrome
}

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript(range: ClosedRange<Int>) -> String {
        return String(self[index(startIndex, offsetBy: range.lowerBound)...index(startIndex, offsetBy: range.upperBound)])
    }
}

print(countSubstrings("aaaaa"))


/*A faster Java solution checking even odd string */

/*
 class Solution {
     int count =1;
     public int countSubstrings(String s) {
         if(s.length()==0)
         return 0;
 
        for(int i=0; i<s.length()-1; i++){
             checkPalindrome(s,i,i);     //To check the palindrome of odd length palindromic sub-string
             checkPalindrome(s,i,i+1);   //To check the palindrome of even length palindromic sub-string
         }
         return count;
     }
 
     private void checkPalindrome(String s, int i, int j) {
         while(i>=0 && j<s.length() && s.charAt(i)==s.charAt(j)){    //Check for the palindrome string
             count++;    //Increment the count if palindromin substring found
             i--;    //To trace string in left direction
             j++;    //To trace string in right direction
         }
     }
 }
 */
