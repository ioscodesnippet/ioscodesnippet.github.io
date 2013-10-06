---
layout: post
title: NSStringf. Simpler printf styled +[NSString stringWithFormat:]
tags:
- ioscodesnippet
- NSString
- printf
- NSLog
- iOS
- tutorial
- cocoa
- objective-c
---
If you thinks that +[NSString stringWithFormat:] is simply annoying.

If you missed the C style string formatter like printf() or NSLog().

[NSString stringWithFormat:@”Why should I type this long?”];

//
//  JTStringAddition.h
//
//  Created by James Tang on 27/08/2011.
//  http://ioscodesnippet.tumblr.com/
//

NSString *NSStringf(NSString *format, ...);


//
//  JTStringAddition.m
//
//  Created by James Tang on 27/08/2011.
//  http://ioscodesnippet.tumblr.com/
//

#import "JTStringAddition.h"

NSString *NSStringf(NSString *format, ...) {
    va_list ap;
    NSString *str;
    va_start(ap,format);
    str=[[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);

    return [str autorelease];
}



NSStringf(@”It’s just so much easier. %@”, @”Really.”);
