--- 
layout: post
name: NSObject-JTCancelableScheduledBlock
title: Cancelable Scheduled Blocks in Objective-C
comments: true
share: true
spec:
  version: 0.0.1
  name: NSObject-JTCancelableScheduledBlock
  homepage: https://gist.github.com/jamztang/1571800
  download: https://gist.github.com/jamztang/1571800/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/1571800.git
tags: 
- blocks
- cancelable scheduled block
- iOS
- nsobject
- nsoperation
- performSelector
---

Sometimes you'd really want to perform a delayed action for your apps. We'll create a category on NSObject to provide a really handy usage.

The best thing with this snippet is your scheduled operations are cancelable, so you can choose to only perform your latest triggered operation (e.g. for your table view cells maybe?)

```objective-c
{% include submodules/NSObject-JTCancelableScheduledBlock/NSObject-JTCancelableScheduledBlock.h %}
```

```objective-c
{% include submodules/NSObject-JTCancelableScheduledBlock/NSObject-JTCancelableScheduledBlock.m %}
```

Usage:
 
```objective-c
[self performBlock:^(void) {
     NSLog(@"delayed operation!");
} afterDelay:2];
```  

Handy right?

You may also interest about how others doing in alternative ways.

[Delayed Blocks in Objective-C](http://forrst.com/posts/Delayed_Blocks_in_Objective_C-0Fn)

[Easy Delayed Messaging using NSProxy and NSInvocation](http://atastypixel.com/blog/easy-delayed-messaging-using-nsproxy-and-nsinvocation/)

Updated 17 May 2012: Thanks [Jesse Armand][] ‏suggesting [this][1]
great article for using the `dispatch_source` in GCD

[1]:http://www.mikeash.com/pyblog/friday-qa-2010-07-02-background-timers.html
[Jesse Armand]:https://twitter.com/#!/jessearmand/status/202976529800630272
