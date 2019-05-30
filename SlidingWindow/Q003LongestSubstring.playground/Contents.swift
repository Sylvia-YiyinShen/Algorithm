import Foundation

/*
 
 Q003 Longest Substring
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:
 
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

/*
 a b c a b c b b
   |   |
 | i   cursor
 start

We need 3 pointers, use sliding window [i, cursor] to check if there is any repeating element
 Once found repeating element, update max length could be found within the sliding window,
 and move start to the element next to the repeated element.
 Then start the next round of sliding window
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count == 0 { return 0 }
    if s.count == 1 { return 1 }
    var chars = [Character](s)
    
    var maxLength = 0
    var start = 0

    for cursor in 1...s.count - 1 {
        for i in start...cursor - 1 {
            if chars[i] == chars[cursor] {
                maxLength = max(maxLength, cursor - start)
                start = i + 1
                break;
            }
        }
    }
    
    return max(maxLength, s.count - start)
}

print(lengthOfLongestSubstring("ab"))
