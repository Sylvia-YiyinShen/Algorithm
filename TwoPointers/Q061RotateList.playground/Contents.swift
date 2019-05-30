import Foundation

/*
 Q061. Rotate List
 
 Given a linked list, rotate the list to the right by k places, where k is non-negative.
 
 Example 1:
 
 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 Example 2:
 
 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
 
 */
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
let fifthNode = ListNode(5)
let sixthNode = ListNode(6)
headNode.next = secondNode
//secondNode.next = thirdNode
//thirdNode.next = fouthNode
//fouthNode.next = fifthNode
//fifthNode.next = sixthNode


/*
 Input:     -> 1 -> 2 -> 3 -> 4 -> 5 -> 6, k = 2
 Expected:  -> 5 -> 6 -> 1 -> 2 -> 3 -> 4
 
 1. traverse the list to get the length, save the oldEnd node
 2. calculate k % length, to find the newEnd node by shift length - k % length - 1
 3. newEnd->next should be the new head
 4. make oldEnd->next = oldHead
 5. newEnd->next = nil
 
 */

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else { return head }
    var length = 1
    var oldEnd = head
    while oldEnd?.next != nil {
        oldEnd = oldEnd?.next
        length += 1
    }
    
    if length < 2 {
        return head
    }
    
    let shift = k % length
    if shift == 0 {
        return head
    }
    
    var newEnd = head
    var i = 1
    while i < length - shift {
        i += 1
        newEnd = newEnd?.next
    }
    
    let newHead = newEnd?.next
    oldEnd?.next = head
    newEnd?.next = nil

    return newHead
}

printList("RESULT", head: rotateRight(headNode, 1))
