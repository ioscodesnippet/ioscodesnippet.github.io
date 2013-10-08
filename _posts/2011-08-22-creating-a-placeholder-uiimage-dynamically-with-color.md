--- 
layout: default
title: Creating a placeholder UIImage dynamically with color
name: UIImage-JTColor
comments: true
alias: post/9247898208/creating-a-placeholder-uiimage-dynamically-with-color
spec:
  version: 0.0.1
  name: UIImage-JTColor
  homepage: https://gist.github.com/jamztang/1571875
  download: https://gist.github.com/jamztang/1571875/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/1571875.git
tags:
- create
- placeholder
- 1 pixel
- image
- UIImage
- UIColor
- color
- iOS
---

Ever needed a placeholder color for your lazy loaded table view cell image view? Typically  can create a 1x1 pixel image in PhotoShop, add it to your project, then load it with UIImageNamed. Can't imagine how lots of effort and steps, and if the placeholder color are requested to be updated, you'd have to repeat the process all over again.

If you needed work with this kind of situations a lot, lets do it programmatically and DRY! Consider the following UIImage-JTColor category.


```objective-c
{% include submodules/UIImage-JTColor/UIImage-JTColor.h %}
```

```objective-c
{% include submodules/UIImage-JTColor/UIImage-JTColor.m %}
```

Usage:

```objective-c
#import "UIImage-JTColor.h"

UIColor *color = [UIColor lightGrayColor];   // Or your whatever UIColor
imageView.image = [UIImage imageWithColor:color];
```

Nothing magical but will saves you a lot of time.

