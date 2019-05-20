// Helper functions
func pad(string : String, toSize: Int = 8) -> String {
    var padded = string
    for _ in 0..<(toSize - string.count) {
        padded = "0" + padded
    }
    return padded
}

func printBinary(of num: UInt8) {
    let str = String(num, radix: 2)
    print("num:\t\(num)\t\tbinary:\t\(pad(string: str))")  // 00010110
}



/*
 We've already solved the problem below, which is similar to the core calculation of isPowerOfTwo1(num: Int)
 
 Q191 Number of 1 Bits
 Write a function that takes an unsigned integer and returns the number of ’1' bits it has (also known as the Hamming weight).
 For example, the 32-bit integer ’11' has binary representation 00000000000000000000000000001011, so the function should return 3.
 */
func hammingWeight(num: UInt32) -> Int {
    var count1s = 0
    var n = num
    while n > 0 {
        count1s += Int(n & 1)
        n = n >> 1
    }
    return count1s
}
printBinary(of: 29)
print("hammingWeight of 29 \(hammingWeight(num: 29))")

