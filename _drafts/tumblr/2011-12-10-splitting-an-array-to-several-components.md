---
layout: post
title: Splitting an array to several components
tags:
- ioscodesnippet
- NSArray
- cocoa
- iOS
---
Say you’d like to split an array into several arrays each with a specific number of components.

// Say your originalArray is [@"A", @"B", @"C", @"D"]
NSArray *originalArray = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", nil];

// And we now want the array to be split into two arrays with two per segment
// like this [[@"A", @"B"], [@"C", @"D"]]
NSArray *newArray = [NSArray splitArray:originalArray componentsPerSegment:1];



And here’s the code snippet on how you can do it.

//
//  NSArray+JTArraySplit.h
//
//  http://ioscodesnippet.tumblr.com
//

#import <Foundation/Foundation.h>

@interface NSArray (JTArraySplit)

+ (NSArray *)splitArray:(NSArray *)targetArray componentsPerSegment:(NSUInteger)componentsCount;

@end


//
//  NSArray+JTArraySplit.m
//
//  http://ioscodesnippet.tumblr.com
//

#import "NSArray+JTArraySplit.h"

@implementation NSArray (JTArraySplit)

+ (NSArray *)splitArray:(NSArray *)targetArray componentsPerSegment:(NSUInteger)componentsCount {
    NSMutableArray *splitedArray = [NSMutableArray array];

    NSUInteger targetArrayCount = [targetArray count];

    if (targetArrayCount > 0) {
        int index = 0;
        while (index < targetArrayCount) {
            int length = MIN(targetArrayCount - index, componentsCount);
            NSArray *subArray = [targetArray subarrayWithRange:NSMakeRange(index, length)];
            [splitedArray addObject:subArray];
            index = index+length;
        }
        return splitedArray;
    } else {
        // no objects inside targetArray, so just return empty array
        return splitedArray;
    }
}

@end
