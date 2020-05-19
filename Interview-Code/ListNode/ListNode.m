//
//  ListNode.m
//  Interview-Code
//
//  Created by sherlock on 2020/5/14.
//  Copyright © 2020 sherlock. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

- (instancetype)initWithValue:(NSInteger)value {
    if (self = [super init]) {
        self.value = value;
    }
    return self;
}

- (BOOL)isEqual:(ListNode *)object {
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[ListNode class]]) {
        return  NO;
    }
    return self.value == object.value;
}

@end

@implementation Node

- (instancetype)initWithElement:(id)element next:(Node *)next {
    if (self = [super init]) {
        self.element = element;
        self.next = next;
    }
    return self;
}

- (BOOL)isEqual:(Node *)object {
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[Node class]]) {
        return  NO;
    }
    return [self.element isEqual:object.element];
}

@end

@interface AbstractList ()
@end

@implementation AbstractList

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSInteger)count {
    return self.size;
}

- (bool)isEmpty {
    return self.size == 0;
}

- (bool)contains:(E)element {
    return [self indexOf:element] != ELEMENT_NOT_FOUND;
}

- (void)add:(E)element {
    [self add:element index:self.size];
}

- (void)outOfBounds:(NSInteger)index {
    NSString *exception = [NSString stringWithFormat:@"IndexOutOfBoundsException Index %ld  size %ld", (long)index, (long)self.size];
    NSAssert(false, exception);
}

- (void)rangeCheck:(NSInteger)index {
    if (index < 0 || index >= self.size) {
        [self outOfBounds:index];
    }
}

- (void)rangeCheckForAdd:(NSInteger)index {
    if (index < 0 || index > self.size) {
        [self outOfBounds:index];
    }
}

@end

@interface SingleLinkedList<T> ()
@property (nonatomic, strong) Node<T> *first;

@end

@implementation SingleLinkedList

- (void)clear {
    self.size = 0;
    self.first = nil;
}

- (E)get:(NSInteger)index {
    /*
     * 最好：O(1)
     * 最坏：O(n)
     * 平均：O(n)
     */
    return [self node:index].element;
}

- (E)set:(NSInteger)index element:(E)element {
    /*
     * 最好：O(1)
     * 最坏：O(n)
     * 平均：O(n)
     */
    Node *node = [self node:index];
    E old = node.element;
    node.element = element;
    return old;
}

/**
 获取index 位置对应的节点
 */
- (Node *)node:(NSInteger)index {
    [self rangeCheck:index];
    
    Node *node = self.first;
    for (NSInteger i = 0; i < index; i ++) {
        node = node.next;
    }
    return node;
}

- (void)add:(E)element index:(NSInteger)index {
    /*
     * 最好：O(1)
     * 最坏：O(n)
     * 平均：O(n)
     */
    [self rangeCheckForAdd:index];
    
    if (index == 0) {
        self.first = [[Node alloc] initWithElement:element next:self.first];
    }else {
        Node *prev = [self node:index - 1];
        prev.next = [[Node alloc] initWithElement:element next:prev.next];
    }
    self.size ++;
}

- (E)remove:(NSInteger)index {
    /*
     * 最好：O(1)
     * 最坏：O(n)
     * 平均：O(n)
     */
    [self rangeCheck:index];
    
    Node *node = self.first;
    if (index == 0) {
        self.first = self.first.next;
    }else {
        Node *prev = [self node:index - 1];
        node = prev.next;
        prev.next = node.next;
    }
    
    self.size --;
    return node.element;
}

@end

@interface LinkedList<__covariant T> ()
@property (nonatomic, strong) ListNode *last;
@property (nonatomic, strong) ListNode *first;
@property (nonatomic, strong) ListNode *previous;
@property (nonatomic, strong) T element;

@end

@implementation LinkedList

- (instancetype)initWithFirst:(ListNode *)first element:(id)element previous:(ListNode *)previous {
    if (self = [super init]) {
        self.first = first;
        self.element = element;
        self.previous = previous;
    }
    return self;
}

- (void)add:(id)element {
    
}

- (void)add:(id)element index:(NSInteger)index {
    
}

- (void)get:(NSInteger)index {
    
}

- (void)remove:(NSInteger)index {
    
}

- (void)removeEelement:(id)element {
    
}

- (NSInteger)indexOf:(id)element {
    return -1;
}

- (NSInteger)count {
    return -1;
}

- (bool)isEmpty {
    return false;
}

- (void)clear {
    
}

@end

@implementation ArrayList

- (void)add:(id)element {
    
}

- (void)add:(id)element index:(NSInteger)index {
    
}

- (E)get:(NSInteger)index {
    return nil;
}

- (E)remove:(NSInteger)index {
    return nil;
}

- (void)removeEelement:(id)element {
    
}

- (NSInteger)indexOf:(id)element {
    return -1;
}

- (NSInteger)count {
    return -1;
}

- (bool)isEmpty {
    return false;
}

- (void)clear {
    
}

@end

