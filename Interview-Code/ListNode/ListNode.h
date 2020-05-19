//
//  ListNode.h
//  Interview-Code
//
//  Created by sherlock on 2020/5/14.
//  Copyright © 2020 sherlock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef id E;
static NSInteger const ELEMENT_NOT_FOUND = -1;

@protocol Listable <NSObject>
@optional
- (void)add:(E)element;
- (void)add:(E)element index:(NSInteger)index;
- (E)get:(NSInteger)index;
- (E)remove:(NSInteger)index;
- (void)removeEelement:(E)element;
- (NSInteger)indexOf:(E)element;
- (E)set:(NSInteger)index element:(E)element;
- (bool)contains:(E)element;
- (NSInteger)count;
- (bool)isEmpty;
- (void)clear;

@end

@interface Node<__covariant T> : NSObject
@property (nonatomic, strong) T element;
@property (nonatomic, strong) Node<T> *next;
- (instancetype)initWithElement:(T)element next:(Node<T> *)next;
@end

@interface AbstractList<__covariant T> : NSObject<Listable>
@property (nonatomic, assign) NSInteger size;
- (void)rangeCheck:(NSInteger)index;
- (void)rangeCheckForAdd:(NSInteger)index;
@end

@interface SingleLinkedList<T> : AbstractList<T>
/**
 获取index 位置对应的节点
 */
- (Node *)node:(NSInteger)index;
@end

@interface ListNode : NSObject
@property (nonatomic, strong, nullable) ListNode *next;
@property (nonatomic, assign) NSInteger value;

- (instancetype)initWithValue:(NSInteger)value;

@end


@interface LinkedList<__covariant T> : NSObject<Listable>

- (instancetype)initWithFirst:(ListNode *)first element:(T)element previous:(ListNode *)previous;
@end

@interface RedBlackTree : NSObject

@end


/**
 内存寻址 假设里面是int 为 4 bytes
 数组get element 的算法复杂度为O(1)
 数组下标和index 不成反比 不会随着index 的增加而变慢
 原因:
 公式: index * 4 + 数组的首地址
 */
@interface ArrayList : NSObject<Listable>


@end


NS_ASSUME_NONNULL_END
