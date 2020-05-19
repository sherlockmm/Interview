//
//  ViewController.m
//  Interview-Code
//
//  Created by sherlock on 2020/5/14.
//  Copyright © 2020 sherlock. All rights reserved.
//

#import "ViewController.h"
#import "ListNode.h"

/**
 binarySearch
 */
NSNumber *binarySearch(NSArray<NSNumber *> *inputArr, NSNumber *searchItem) {
    NSInteger lowerIndex = 0;
    NSInteger upperIndex = inputArr.count - 1;
    
    if (lowerIndex > upperIndex) {
        return nil;
    }
    
    while (true) {
        NSInteger currentIndex = (lowerIndex + upperIndex) / 2;
        if (inputArr[currentIndex].integerValue == searchItem.integerValue) {
            return @(currentIndex);
        }else if (lowerIndex > upperIndex) {
            return nil;
        }else {
            if (inputArr[currentIndex].integerValue > searchItem.integerValue) {
                upperIndex = currentIndex - 1;
            }else {
                lowerIndex = currentIndex + 1;
            }
        }
    }
}


/**
 Reverse List:
 */

/**
 input : 1->2->3
 output: 3->2->1
 
 1 - newHead -> 2.next = 3 3.next = nil
 heade = 1
 head.next 2
 head.next.next = 3
 */
ListNode *reverseList_recursive(ListNode *head) {
    if (head == nil || head.next == nil) {
        return head;
    }

    ListNode *newHead = reverseList_recursive(head.next);
    head.next.next = head;
    head.next = nil;
    
    return newHead;
}

ListNode *reverseList(ListNode *head) {
    if (head == nil || head.next == nil) {
        return head;
    }
    
    ListNode *newHead = nil;
    while (head != nil) {
        ListNode *temp = head.next;
        head.next = newHead;
        newHead = head;
        head = temp;
    }
    
    return newHead;
}


void test_reversListNode() {
    ListNode *head = [[ListNode alloc] initWithValue:1];
    head.next = [[ListNode alloc] initWithValue:2];
    head.next.next = [[ListNode alloc] initWithValue:3];
   
    ListNode *reslutNode2 = reverseList(head);
    
    ListNode *resultNode = reverseList_recursive(head);
}


/**
 判断一个链表是否有环
 思路: 快慢指针
 距离n 步 while 后 n - 1 -> n - 2 -> n - 3 .....
 fast 走两步
 slow 每次走一步
*/
bool hasCycle(ListNode *head) {
    if (head == nil || head.next == nil) {
        return false;
    }
    
    ListNode *slow = head;
    ListNode *fast = head.next;
    while (fast != nil && fast.next != nil) {
        slow = slow.next;
        fast = fast.next.next;
        if (slow == fast) return true;
    }
    
    return false;
}

void test_has_cycle() {
    ListNode *head = [[ListNode alloc] initWithValue:1];
    head.next = [[ListNode alloc] initWithValue:2];
    head.next.next = [[ListNode alloc] initWithValue:3];
    head.next.next = head;
    
    bool result = hasCycle(head);
    
}

/**
 虚拟头节点:里面不放任何数据
 */

/**
 输入两个链表，找出它们的第一个公共节点
 */
ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
    ListNode *node1 = headA;
    ListNode *node2 = headB;
    while (node1 != node2) {
        node1 = node1 != nil ? node1.next : headB;
        node2 = node2 != nil ? node2.next : headA;
    }
    return node1;
}

void test_getIntersectionNode() {
    ListNode *headA = [[ListNode alloc] initWithValue:4];
    headA.next = [[ListNode alloc] initWithValue:1];
    headA.next.next = [[ListNode alloc] initWithValue:8];
    headA.next.next.next = [[ListNode alloc] initWithValue:4];
    headA.next.next.next.next = [[ListNode alloc] initWithValue:5];
    
    ListNode *headB = [[ListNode alloc] initWithValue:1];
    headB.next = [[ListNode alloc] initWithValue:2];
    headB.next.next = [[ListNode alloc] initWithValue:3];
    headB.next.next.next = headA.next.next.next;
    
    ListNode *node = getIntersectionNode(headA, headB);
    
    while (node != nil ) {
        NSLog(@"node element %ld", (long)node.value);
        node = node.next;
    }
    
}

/**
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。

 给定一个链表: 1->2->3->4->5, 和 k = 2.

 返回链表 4->5.
 */
ListNode * getKthFromEnd(ListNode* head, int k) {
    
    ListNode *next = head;
    int n = 0;
    while (head != nil) {
        head = head.next;
        n ++;
    }
    
    for (int i = 0; i < n - k; i ++) {
        if (next != nil) {
            next = next.next;
        }
    }
    
    return next;
}

/**
 1. 初始化： 前指针 former 、后指针 latter ，双指针都指向头节点 head​ 。
 2. 构建双指针距离： 前指针 former 先向前走 k 步（结束后，双指针 former 和 latter 间相距 k 步）。
 3. 双指针共同移动： 循环中，双指针 former 和 latter 每轮都向前走一步，直至 former 走过链表 尾节点 时跳出（跳出后， latter 与尾节点距离为 k-1，即 latter 指向倒数第 k 个节点）。
 4. 返回值： 返回 latter 即可。

 给定一个链表: 1->2->3->4->5, 和 k = 2.

 返回链表 4->5.
 */
ListNode *get_KthFromEnd(ListNode *head, int k) {
    if (head == nil || k < 0) return head;
    
    ListNode *former = head;
    ListNode *latter = head;
    for (int i = 0; i < k; i ++) {
        former = former.next;
    }
    while (former != nil) {
        former = former.next;
        latter = latter.next;
    }
    return latter;
}

void test_getKthFromEnd() {
    ListNode *head = [[ListNode alloc] initWithValue:1];
    head.next = [[ListNode alloc] initWithValue:2];
    head.next.next = [[ListNode alloc] initWithValue:3];
    head.next.next.next = [[ListNode alloc] initWithValue:4];
    head.next.next.next.next = [[ListNode alloc] initWithValue:5];
    
    ListNode *node = get_KthFromEnd(head, 2);
    
}

/**
 给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。

 返回删除后的链表的头节点。
 
 输入: head = [4,5,1,9], val = 5
 输出: [4,1,9]
 解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.

 */
ListNode * deleteNode(ListNode * head, int val) {
    if (head.value == val) return head.next;
    
    ListNode *pre = head;
    ListNode *cur = head.next;
    while (cur != nil && cur.value != val) {
        pre = cur;
        cur = cur.next;
    }
    if (cur != nil) pre.next = cur.next;
    
    return head;
}

void test_deleteNode() {
    ListNode *head = [[ListNode alloc] initWithValue:1];
    head.next = [[ListNode alloc] initWithValue:2];
    head.next.next = [[ListNode alloc] initWithValue:3];
    head.next.next.next = [[ListNode alloc] initWithValue:3];
    head.next.next.next.next = [[ListNode alloc] initWithValue:5];
    
    ListNode *node = deleteNode(head, 3);
    
}

/**
 编写代码，移除未排序链表中的重复节点。保留最开始出现的节点。
 输入：[1, 2, 3, 3, 2, 1]
 输出：[1, 2, 3]
 
 输入：[1, 1, 1, 1, 2]
 输出：[1, 2]
 */
ListNode * removeDuplicateNodes(ListNode * head) {
    if (head == nil || head.next == nil) return head;
    
    ListNode *node = head;
    
    NSMutableSet<NSNumber *> *set = [NSMutableSet set];
    [set addObject:@(head.value)];
    
    while (node.next != nil) {
        NSInteger value = node.next.value;
        if ([set containsObject:@(value)]) {
            node.next = node.next.next;
        }else {
            [set addObject:@(value)];
            node = node.next;
        }
    }
    
    return head;
}

ListNode *remove_duplicateNodes(ListNode *head) {
    if (head == nil || head.next == nil) return head;
    
    ListNode *dummyHead = [[ListNode alloc] initWithValue:-1];
    dummyHead.next = head;
    ListNode *prev = dummyHead;
    while (prev.next != nil) {
        ListNode *cur = prev.next;
        if (prev.next.value == cur.next.value) {
            cur.next = cur.next.next;
        }else {
            cur = cur.next;
        }
        prev = prev.next;
    }
    return dummyHead.next;
}

void test_removeDuplicateNodes() {
    ListNode *head = [[ListNode alloc] initWithValue:1];
    head.next = [[ListNode alloc] initWithValue:2];
    head.next.next = [[ListNode alloc] initWithValue:3];
    head.next.next.next = [[ListNode alloc] initWithValue:3];
    head.next.next.next.next = [[ListNode alloc] initWithValue:5];
    
    ListNode *node = removeDuplicateNodes(head);
    ListNode *node1 = remove_duplicateNodes(head);
    
}

/**
 实现一种算法，找出单向链表中倒数第 k 个节点。返回该节点的值。
 输入： 1->2->3->4->5 和 k = 2
 输出： 4
 */
NSInteger kthToLast(ListNode *head, int k) {
    ListNode *p = head;
    for (int i = 0; i < k; i ++) {
        p = p.next;
    }
    while (p != nil) {
        p = p.next;
        head = head.next;
    }
    return head.value;
}

void test_kthToLast() {
    ListNode *head = [[ListNode alloc] initWithValue:1];
    head.next = [[ListNode alloc] initWithValue:2];
    head.next.next = [[ListNode alloc] initWithValue:3];
    head.next.next.next = [[ListNode alloc] initWithValue:4];
    head.next.next.next.next = [[ListNode alloc] initWithValue:5];
    
    NSInteger val = kthToLast(head, 3);
    
}

void test_linkedList() {
    SingleLinkedList<NSNumber *> *list = [[SingleLinkedList alloc] init];
    [list add:@(1)];
    [list add:@(2)];

    [list remove:1];
    NSInteger size = list.count;
    bool isEmpty = list.isEmpty;
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    test_has_cycle();
    test_getIntersectionNode();
    test_getKthFromEnd();
    test_deleteNode();
    test_removeDuplicateNodes();
    test_kthToLast();
}


@end
