---
layout: post
name: JTTargetActionBlock
title: 'Adding Block support for UIControl''s Target-Action mechanism '
spec:
  name: UIControl-JTTargetActionBlock
  version: 0.0.1
  homepage: https://gist.github.com/jamztang/2205564
  download: https://gist.github.com/jamztang/2205564/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/2205564.git
tags:
- UIControl
- blocks
- target-action
---

Tired of [Target-Action][2]? Welcome to the world of [blocks][1].

```objective-c
{% include submodules/JTTargetActionBlock/UIControl-JTTargetActionBlock.h %}
```

```objective-c
{% include submodules/JTTargetActionBlock/UIControl-JTTargetActionBlock.m %}
```

Sample usage:

```objective-c
UIButton *button = ...;
[button addEventHandler:^(id sender, UIEvent *event) {
    NSLog(@"touchedUp!");
} forControlEvent:UIControlEventTouchUpInside];
```

This is a very simple implementation of adding block support for UIControls. Download the snippet from [here][3], instantly saves you a few lines of code. 

If you are finding for a more complex block addition of everything, you maybe interested to have a look at [zwaldowski / BlocksKit][4].

[1]:http://developer.apple.com/library/ios/#documentation/cocoa/Conceptual/Blocks/Articles/00_Introduction.html
[2]:http://developer.apple.com/library/ios/#documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html#//apple_ref/doc/uid/TP40009071-CH3-SW1
[3]:https://gist.github.com/2205564
[4]:https://github.com/zwaldowski/BlocksKit

