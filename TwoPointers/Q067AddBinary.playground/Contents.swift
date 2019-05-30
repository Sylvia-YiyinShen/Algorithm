import Foundation

/*
 Q067. Add Binary
 
 Given two binary strings, return their sum (also a binary string).
 
 The input strings are both non-empty and contains only characters 1 or 0.
 
 Example 1:
 
 Input: a = "11", b = "1"
 Output: "100"
 Example 2:
 
 Input: a = "1010", b = "1011"
 Output: "10101"
 */

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

func addBinary(_ a: String, _ b: String) -> String {
    var res = ""
    var aIndex = a.count - 1
    var bIndex = b.count - 1
    
    var carry = 0
    while aIndex >= 0 || bIndex >= 0 {
        let aChar = aIndex >= 0 ? a[aIndex] : "0"
        let bChar = bIndex >= 0 ? b[bIndex] : "0"
        
        let sum = (Int(String(aChar)) ?? 0) + (Int(String(bChar)) ?? 0) + carry
        if sum == 0 {
            res.insert("0", at: res.startIndex)
            carry = 0
        } else if sum == 1 {
            res.insert("1", at: res.startIndex)
            carry = 0
        } else if sum == 2 {
            res.insert("0", at: res.startIndex)
            carry = 1
        } else {
            res.insert("1", at: res.startIndex)
            carry = 1
        }
        
        aIndex -= 1
        bIndex -= 1
    }
    
    if carry == 1 {
        res.insert("1", at: res.startIndex)
    }
    
    return res
}

print(addBinary("0", "0"))
print(addBinary("1010", "1011"))

