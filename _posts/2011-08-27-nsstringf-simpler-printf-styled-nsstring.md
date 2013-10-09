---
layout: post
name: JTStringAddition
title: NSStringf. Simpler printf styled +[NSString stringWithFormat:]
spec:
  homepage: https://gist.github.com/jamztang/1578509
  download: https://gist.github.com/jamztang/1578509/download
  source:
    git: git://gist.github.com/1578509.git
tags:
- NSString
- printf
- NSLog
- iOS
---

If you thinks that +[NSString stringWithFormat:] is simply annoying.

If you missed the C style string formatter like printf() or NSLog().

```objective-c
[NSString stringWithFormat:@”Why should I type this long?”];
```

Consider following helper:

```objective-c
//
//  JTStringAddition.h
//
//  Created by James Tang on 27/08/2011.
//  http://ioscodesnippet.tumblr.com/
//

NSString *NSStringf(NSString *format, ...);
```

```objective-c
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
```

NSStringf(@”It’s just so much easier. %@”, @”Really.”);

