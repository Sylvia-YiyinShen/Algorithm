import Foundation

/*
 318. Maximum Product of Word Lengths
 
 Given a string array words, find the maximum value of length(word[i]) * length(word[j]) where the two words do not share common letters. You may assume that each word will contain only lower case letters. If no such two words exist, return 0.
 
 Example 1:
 
 Input: ["abcw","baz","foo","bar","xtfn","abcdef"]
 Output: 16
 Explanation: The two words can be "abcw", "xtfn".
 
 
 Example 2:
 
 Input: ["a","ab","abc","d","cd","bcd","abcd"]
 Output: 4
 Explanation: The two words can be "ab", "cd".
 
 
 
 Example 3:
 
 Input: ["a","aa","aaa","aaaa"]
 Output: 0
 Explanation: No such pair of words.

 */



/*
 Use bit operations to mark
 a num:    1        binary:    00000001
 b num:    2        binary:    00000010
 c num:    4        binary:    00000100
 
 Then we can use | OR operator mark a string contains a, b, c as binary 00000111
 And we can compare if two strings have commom character by checking stringA & stringB != 0
 e.g.
 stringA  "abc" 00000111
 stringB  "ade" 00011001
 stringC  "def" 00111000
 
 stringA & stringB == 0  -> false
 stringC & stringB == 0  -> true
 
 We only need 16 bits, so UInt32 is enough for the solution
 
 */

func maxProduct(_ words: [String]) -> Int {
    if words.count == 0 { return 0 }
    var res = 0
    var binaryList = [UInt32](repeating: 0, count: words.count)
    for i in 0...(words.count - 1) {
        let word = words[i]
        let binray = convertStringToBinary(string: word)
        binaryList[i] = binray
        
        for j in 0...i {
            let anotherWordBinary = binaryList[j]
            if binray & anotherWordBinary == 0 {
                res = max(res, words[i].count * words[j].count)
            }
        }
    }
    return res
}

func convertStringToBinary(string: String) -> UInt32 {
    var x: UInt32 = 0
    string.forEach { (char) in
        let deltaValue = UInt32(1) << (getUnicodeValue(char: char) - getUnicodeValue(char: "a"))
        x = x | deltaValue
    }
    return x
}

func getUnicodeValue(char: Character) -> UInt32 {
    let scalars = char.unicodeScalars
    return scalars[scalars.startIndex].value
}

print(maxProduct(["abcw","baz","foo","bar","xtfn","abcdef"]))
print(maxProduct(["a","ab","abc","d","cd","bcd","abcd"]))
print(maxProduct(["a","aa","aaa","aaaa"]))
print(maxProduct([]))
