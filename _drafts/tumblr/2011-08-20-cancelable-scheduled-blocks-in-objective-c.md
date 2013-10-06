---
layout: post
title: Cancelable Scheduled Blocks in Objective-C
tags:
- blocks
- cancelable scheduled block
- category
- iOS
- nsobject
- nsoperation
- objective-c
- ioscodesnippet
---
Sometimes you’d really want to perform a delayed action for your apps. We’ll create a category on NSObject to provide a really handy usage.

The best thing with this snippet is your scheduled operations are cancelable, so you can choose to only perform your latest triggered operation (e.g. for your table view cells maybe?)

``` objective-c
//
//  NSObject+JTCancelableScheduledBlock.h
//
//  Created by James Tang on 20/08/2011.
//  http://ioscodesnippet.tumblr.com/
//

#import <Foundation/Foundation.h>



@interface NSObject (JTCancelableScheduledBlock)



- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay cancelPreviousRequest:(BOOL)cancel;



@end


//
//  NSObject+JTCancelableScheduledBlock.m
//
//  Created by James Tang on 20/08/2011.
//  http://ioscodesnippet.tumblr.com/
//

#import "NSObject+JTCancelableScheduledBlock.h"



@implementation NSObject (JTCancelableScheduledBlock)



- (void)delayedAddOperation:(NSOperation *)operation {

    [[NSOperationQueue currentQueue] addOperation:operation];

}



- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {

    [self performSelector:@selector(delayedAddOperation:)

               withObject:[NSBlockOperation blockOperationWithBlock:block]

               afterDelay:delay];

}



- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay cancelPreviousRequest:(BOOL)cancel {
    if (cancel) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
    }
    [self performBlock:block afterDelay:delay];

}

@end
```



Usage:

``` objective-c
[self performBlock:^(void) {
     NSLog(@"delayed operation!");
} afterDelay:2];
```


Handy right?



You may also interest about how others doing in alternative ways.

Delayed Blocks in Objective-C

Easy Delayed Messaging using NSProxy and NSInvocation

Updated 17 May 2012: Thanks Jesse Armand ‏suggesting this great article for using the dispatch_source in GCD

