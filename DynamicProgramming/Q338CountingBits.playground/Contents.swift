import Foundation

/*
 Q338. Counting Bits
 
 Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
 
 Example 1:
 
 Input: 2
 Output: [0,1,1]
 Example 2:
 
 Input: 5
 Output: [0,1,1,2,1,2]
 Follow up:
 
 It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
 Space complexity should be O(n).
 Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
 */

/*
 
 num:    1        binary:    00000001
 num:    2        binary:    00000010
 num:    3        binary:    00000011
 num:    4        binary:    00000100
 num:    5        binary:    00000101
 num:    6        binary:    00000110
 num:    7        binary:    00000111
 num:    8        binary:    00001000
 num:    9        binary:    00001001
 num:    10        binary:    00001010
 num:    11        binary:    00001011
 num:    12        binary:    00001100
 num:    13        binary:    00001101
 num:    14        binary:    00001110
 num:    15        binary:    00001111
 
 Define f(n) number of 1s in binary presentation for n
 for number  2^i<= n < 2^(i-1)
 f(n) = 1 + f(n % 2^i)
 */


func countBits(_ num: Int) -> [Int] {
    if num == 0 { return [0] }
    if num == 1 { return [0, 1] }
    
    var results = [Int](repeating: 0, count: num + 1)
    var p = 1
    for i in 1...num {
        if i == 2 * p { p *= 2}
        results[i] = 1 + results[i%p]
    }
    
    return results
}

func pad(string : String, toSize: Int = 8) -> String {
    var padded = string
    for _ in 0..<(toSize - string.count) {
        padded = "0" + padded
    }
    return padded
}

func printBinary(of num: Int) {
    let str = String(num, radix: 2)
    print("num:\t\(num)\t\tbinary:\t\(pad(string: str))")  // 00010110
}

let result = countBits(20)
for i in 0...result.count - 1 {
    printBinary(of: i)
    print(result[i])
}
