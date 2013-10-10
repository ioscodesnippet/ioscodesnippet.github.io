---
layout: post
name: UIApplicationAddition
title: Quickly switch supported UIInterfaceOrientation for your View Controllers
spec:
  homepage: https://gist.github.com/jamztang/2853792
  download: https://gist.github.com/jamztang/2853792/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/2853792.git
tags:
- ios
- quickly
- change
- interface orientation
- UIViewControllers
- shouldAutorotateToInterfaceOrientation
---

![](http://media.tumblr.com/tumblr_m4y8dmMMFa1qd122y.png)

In Xcode 4, you can simply point-and-click to specify supported
orientation in your info.plist. But wait, it **doesn't** really make
your app obey to that certain interface orientation.

You still have to implement the `- [UIViewController
shouldAutorotateToInterfaceOrientation:]` and return a right value.

Your specified value is located in your app's info.plist, so here's the
code to let you easily access that configuration.

<script src="https://gist.github.com/2853792.js?file=UIApplicationAddition.h"> </script>

Example usage


```objective-c
// In your ViewController.m subclass that you wish to just obey the specified supported orientations,

#import "UIApplicationAddition.h"

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
  {
    return
UIInterfaceOrientationIsSupportedOrientation(interfaceOrientation);
}
```

Now you can just point-and-click to **really** change the supported
orientations! 

