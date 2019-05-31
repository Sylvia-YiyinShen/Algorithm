import Foundation

/*
 Q139. Word Break Dynamic Programming

 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note:

 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 Example 1:

 Input: s = "leetcode", wordDict = ["leet", "code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 Example 2:

 Input: s = "applepenapple", wordDict = ["apple", "pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.

 Example 3:

 Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output: false

 */

/*
 Take catsandog as exampl
 We start to check if we can break the substring from the last char 'g', then 'og', 'dog', and we need to record the places we can break.
 So when we look at the longer string, we can reuse the results from a previous round

 Check if we find wordDic contains in this order
 g      - g: NO
 og     - o:  NO
 - og:  NO
 dog    - d: NO
 - do:   NO
 - dog:  Yes, but we can only break when we can cut at the place before dog and after dog, in this case YES, since
 ndog   continues.....
 ...
 andog  - ...
 - and: Yes, wordDic contains 'and', however because from the previous rounds, we can not cut d|o, so we can not cut before a, like |andog

 catsandog - finally, we will end with we cannot cut just before 'c', that is the result of the whole string. because we can not break like cat|sandog

 */

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var canBreak = [Bool](repeating: false, count: s.count + 1)
    canBreak[s.count] = true

    for i in (0...s.count - 1).reversed() {
        for j in i + 1...s.count {
            //            print("checking \(s[i...(j - 1)])")
            if wordDict.contains(s[i...(j - 1)]) && canBreak[j] {
                //                print("can break here")
                canBreak[i] = true
            }
        }
    }

    return canBreak[0]
}


extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript(range: ClosedRange<Int>) -> String {
        return String(self[index(startIndex, offsetBy: range.lowerBound)...index(startIndex, offsetBy: range.upperBound)])
    }
}

// Another solution faster than 99.58% of Swift online submissions for Word Break
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var map = [String: Bool]()
        return wordBreakSub(s, wordDict, &map)
    }

    func wordBreakSub(_ s: String, _ wordDict: [String],_ map: inout [String: Bool]) -> Bool {
        for word in wordDict {
            if s == word {
                return true
            } else if s.hasPrefix(word) {
                let subStr = String(s.dropFirst(word.count))
                if let result = map[subStr] {
                    return result
                } else {
                    let result = wordBreakSub(subStr, wordDict, &map)
                    map[subStr] = result
                    if result == true {
                        return true
                    }
                }
            }
        }

        return false
    }
}


print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))

