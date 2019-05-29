import Foundation


/*
 Q234 Palindrome Linked List
 
 Given a singly linked list, determine if it is a palindrome.
 
 Example 1:
 
 Input: 1->2
 Output: false
 Example 2:
 
 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 */

/*
 Since the ListNode class provided only has a next pointer
 So we have to create a way that we can go backward
 
 You might think of converting the singly-linked list into an array, but it requires O(n) space
 
 Solution:
 Create two head points: fast and slow, start to traverse the list, fast always go to the next next node, slow always go to the next
 The aim is to let slow find the start node of the second half
 1 -> 2 -> 3 -> 4
 fast 1  fast 3  fast nil
 slow 1  slow 2  slow 3
 
 Next make fast point to head again
 We will end up with
 fast 1 -> 2 -> 3 -> 4
 slow 3 -> 4
 
 Reverse slow, we will have a reversed second half of the list and the origial first half
 slow 4 -> 3
 fast 1 -> 2 -> 3
 
 Traverse slow and fast at the same time, if all the values listed in slow are the same in fast list, it is a palindrome
 
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

func isPalindrome(_ head: ListNode?) -> Bool {
    var slow = head, fast = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    if fast != nil { slow = slow?.next }
    fast = head
    
    slow = reverse(slow)
    
    while slow != nil {
        guard fast?.val == slow?.val else { return false }
        fast = fast?.next
        slow = slow?.next
    }
    return true
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

print(isPalindrome(headNode))
