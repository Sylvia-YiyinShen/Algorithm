import Foundation
/*
 Q002. Add Two Numbers
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

/*
 Two pointers to add numbers node by node
 Tricks:
 1. we need varaible carry   4 + 7 = 11, we should make the sum of the current node to be 1, carry 1 to the next node
 2. we have to consider one list contains more node than the other one, so the loop goes until nodes in both list and carry are 0
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var listNode = ListNode(0)
    let result = listNode
    
    var list1 = l1
    var list2 = l2
    
    var carry = 0
    while list1 != nil || list2 != nil {
        var sum = carry
        sum += (list1?.val ?? 0) + (list2?.val ?? 0)
        list1 = list1?.next
        list2 = list2?.next
        
        if sum > 9 {
            carry = 1
            sum = sum - 10
        } else {
            carry = 0
        }
        
        listNode.next = ListNode(sum)
        listNode = listNode.next!
        
    }
    
    if carry > 0 {
        listNode.next = ListNode(carry)
    }
    
    return result.next
}

let headNode1 = ListNode(2)
let secondNode1 = ListNode(4)
let thirdNode1 = ListNode(3)
headNode1.next = secondNode1
secondNode1.next = thirdNode1

let headNode2 = ListNode(5)
let secondNode2 = ListNode(6)
let thirdNode2 = ListNode(4)
headNode2.next = secondNode2
secondNode2.next = thirdNode2

printList("result", head: addTwoNumbers(headNode1, headNode2))


