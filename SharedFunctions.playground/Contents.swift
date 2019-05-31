import Foundation

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript(range: ClosedRange<Int>) -> String {
        return String(self[index(startIndex, offsetBy: range.lowerBound)...index(startIndex, offsetBy: range.upperBound)])
    }
}

print("1234"[0])

// unicode

func getNumIndex(char: Character) -> Int {
    return Int(getUnicodeValue(char: char) - getUnicodeValue(char: "A"))
}

func getUnicodeValue(char: Character) -> UInt32 {
    let scalars = char.unicodeScalars
    return scalars[scalars.startIndex].value
}

// bit manipulation helper functions
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

// list
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverse(_ head: ListNode?) -> ListNode? {
    var current = head, previous: ListNode? = nil
    while current != nil {
        let next = current?.next
        current?.next = previous
        
        previous = current
        current = next
    }
    return previous
}

func printList(_ name:String, head: ListNode?) {
    var string = ""
    var start: ListNode? = head
    while start != nil {
        if let startEnd = start {
            string += String(" -> \(startEnd.val)")
            start = startEnd.next
        }
    }
    print("\(name) \(string)")
}

let headNode = ListNode(1)
let secondNode = ListNode(2)
let thirdNode = ListNode(3)
let fouthNode = ListNode(4)
headNode.next = secondNode
secondNode.next = thirdNode
thirdNode.next = fouthNode

