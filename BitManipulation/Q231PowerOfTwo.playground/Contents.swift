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
 Leetcode  Q231  Power of Two
 Given an integer, write a function to determine if it is a power of two.
 */

/*
 A normal approach will be using while loop to divide by 2 and end up with time complexity of O(log n)
 If use bit operations, we can achieve time complexity of O(1)
 */

func divideBy2(num: Int) {
    var n = num
    while n % 2 == 0 {
        n = n / 2
        if n == 2 {
            print("is a power of 2")
            return
        }
    }
    print("not a power of 2")
}

divideBy2(num: 8)

// If use bit operations, we can achieve time complexity of O(1)

printBinary(of: 1) // 00000001
printBinary(of: 2) // 00000010
printBinary(of: 4) // 00000100
printBinary(of: 8) // 00001000
printBinary(of: 16)// 00010000
/*
 As a power of 2, its binary presentation always contains only-one 1
 
 Coming up with an approach: count the number of 1s
 
 We need >> to shift the bits and '& 1' (& 00000001) to check if the last bit is 1
 */

func isPowerOfTwo1(num: Int) -> Bool {
    var count1s = 0
    var n = num
    while n > 0 {
        count1s += n & 1
        n = n >> 1
    }
    return count1s == 1
}

func printReuslts(_ num: Int) {
    print("is \(num) a power of 2 : \(isPowerOfTwo1(num: num))")
}

printReuslts(2)
printReuslts(21)
printReuslts(16)
printReuslts(256)
printReuslts(254)


/*
 Another approach:
 First, observer binary of n and n - 1
 */

printBinary(of: 16)
printBinary(of: 16 - 1)
printBinary(of: 32)
printBinary(of: 32 - 1)
/*
 num:    16        binary:    00010000
 num:    15        binary:    00001111
 num:    32        binary:    00100000
 num:    31        binary:    00011111
 
 If the result of n & (n - 1) should always be 0, if n is a power of 2
 */

func isPowerOfTwo2(num: Int) -> Bool {
    return (num > 0) && (num & (num - 1)) == 0
}

print(isPowerOfTwo2(num: 2))
print(isPowerOfTwo2(num: 6))
print(isPowerOfTwo2(num: 8))
print(isPowerOfTwo2(num: 256))
print(isPowerOfTwo2(num: 255))
