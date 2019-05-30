import Foundation

/*
 Q424 Longest Repeating Character Replacement
 
 Given a string that consists of only uppercase English letters, you can replace any letter in the string with another letter at most k times. Find the length of a longest substring containing all repeating letters you can get after performing the above operations.
 
 Note:
 Both the string's length and k will not exceed 104.
 
 Example 1:
 
 Input:
 s = "ABAB", k = 2
 
 Output:
 4
 
 Explanation:
 Replace the two 'A's with two 'B's or vice versa.
 Example 2:
 
 Input:
 s = "AABABBA", k = 1
 
 Output:
 4
 
 Explanation:
 Replace the one 'A' in the middle with 'B' and form "AABBBBA".
 The substring "BBBB" has the longest repeating letters, which is 4.
 
 */

func characterReplacement(_ s: String, _ k: Int) -> Int {
    if s.count == 0 { return 0 }
    var hashMap = [Int](repeating: 0, count: 26)
    var chars = [Character](s)
    
    var length = 0
    var res = 0
    var left = 0
    var right = 0
    var change = 0
    var maxCount = 0
    
    while right < chars.count {
        let currChar = chars[right]
        right += 1
        let currIndex = getNumIndex(char: currChar)
        hashMap[currIndex] = hashMap[currIndex] + 1
        maxCount = max(maxCount, hashMap[currIndex])
        length += 1
        change = length - maxCount
        while change > k {
            let prevChar = chars[left]
            let prevIndex = getNumIndex(char: prevChar)
            hashMap[prevIndex] = hashMap[prevIndex] - 1
            for i in 0...25 {
                if hashMap[i] > maxCount {
                    maxCount = hashMap[i]
                    break
                }
            }
            length -= 1
            change = length - maxCount
            left += 1
        }
        
        res = max(res, length)
    }
    
    return res
}

func getNumIndex(char: Character) -> Int {
    return Int(getUnicodeValue(char: char) - getUnicodeValue(char: "A"))
}

func getUnicodeValue(char: Character) -> UInt32 {
    let scalars = char.unicodeScalars
    return scalars[scalars.startIndex].value
}

print(characterReplacement("AABABBA", 1))

print(getUnicodeValue(char: "A")) // 65
