---
layout: post
title: Adding drop shadow on UINavigationBar (before iOS 6)
name: UINavigationBar-JTDropShadow
comment: true
share: true
spec:
  homepage: https://gist.github.com/jamztang/6913226
  download: https://gist.github.com/jamztang/6913226/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/6913226.git
tags:
- iOS
- adding
- drop shadow
- dropshadow
- navigation bar
- UINavigationBar
---

We've an update on this technique for iOS 6.1, please see

> [Using custom drop shadows in UINavigationBar (fix for iOS 6.1)][1]

---

![](/images/2011-09-20-adding-drop-shadow-on-uinavigationbar/navigation-bar.png)

Somehow adding drop shadows on UINavigationBar using the CALayer
property fails for me but I later find it out we just need a little
trick there.

```objective-c
// The magic is to have -[UIView clipToBounds] set to NO
self.navigationController.navigationBar.clipsToBounds = NO;
```

Base on the fact this is ioscodesnippet, I know I have to make a really simple UINavigationBar-JTDropShadow category to make our life more easier.

<script src="https://gist.github.com/6913226.js?file=UINavigationBar-JTDropShadow.h"></script>
<script src="https://gist.github.com/6913226.js?file=UINavigationBar-JTDropShadow.m"></script>

Usage:

```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    ...
    [self.navigationController.navigationBar dropShadowWithOffset:CGSizeMake(0, 3)
                                                           radius:1
                                                            color:[UIColor darkGrayColor]
                                                          opacity:1];
    ...
}
```

Make sure you've already imported `QuartzCore.framework` in your build settings.

While it is more generic by making it a UIView category, but I’ll leave it simple here to demonstrate the main purpose.


[1]:/post/61487770156/custom-shadow-image-on-navigation-bar-ios6-fix

