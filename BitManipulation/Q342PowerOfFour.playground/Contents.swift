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
 Q342 Power of Four
 Given an integer (signed 32 bits), write a function to check whether it is a power of 4.
 */
printBinary(of: 4)
printBinary(of: 16)
printBinary(of: 64)

/*
 num:    4        binary:    00000100
 num:    16        binary:    00010000
 num:    64        binary:    01000000
 */

/*
 Solving Power of Four we care about 3 bits, if the last 3 bits is '100',
 so instead of & 1 to check the last 3 bits, we use '& 7' (& 111) and we count the number of '100' we have found
 if it is '100' we increase the count, return false if the count > 1
 if it is '000' we can shift right by 2
 if it is other value besides of '100' or '000', then it can not be a power of 4, return false directly
 */

func isPowerOfFour1(num: Int) -> Bool {
    if num == 0 { return false }
    
    var count100s = 0
    var n = num
    while n >= 4 {
        if n & 7 == 4 {
            if count100s > 0 { return false }
            count100s += 1
        } else if n & 7 != 0 {
            return false
        }
        n = n >> 2
    }
    
    if n < 4 && n != 1 {
        return false
    } else {
        return count100s == 1
    }
}

print("is power of 4: \(isPowerOfFour1(num: 4))")
print("is power of 4: \(isPowerOfFour1(num: 12))")
print("is power of 4: \(isPowerOfFour1(num: 64))")

printBinary(of: 15)
printBinary(of: 16)
printBinary(of: 17)


/*
 We will be able to find another solution by introducing 0x55555555,
 0x55555555 = 0101 0101 ... 0101
 0xaaaaaaaa = 1010 1010 ... 1010
 
 For a power of 4: n,  n & 0x55555555 should be n
 */
func isPowerOfFour2(num: Int) -> Bool {
    return (num > 0) && (num & (num - 1)) == 0 && (num & 0x55555555) == num
}


/*
 Other solutions, I am not going to cover so much in this page
 */
func isPowerOfFour3(num: Int) -> Bool {
    return (num > 0) && (num & (num - 1)) == 0 && (num - 1) % 3 == 0
}

// works in C++, NOT work in Swift or Java,
func isPowerOfFour4(num: Int) -> Bool {
    let res = log(Double(num)) / log(3.0)
    let ceilRes = ceil(res)
    return (num > 0) && (res == ceilRes)
}

print(isPowerOfFour4(num: 15))
print(isPowerOfFour4(num: 16))
print(isPowerOfFour4(num: 4))
