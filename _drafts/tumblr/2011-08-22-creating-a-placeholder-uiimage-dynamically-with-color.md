---
layout: post
title: Creating a placeholder UIImage dynamically with color
publish: false
tags:
- UIImage
- category
- iOS
- ioscodesnippet
- UIColor
- objective-c
---
Ever needed a placeholder color for your lazy loaded table view cell image view? Typically  can create a 1x1 pixel image in PhotoShop, add it to your project, then load it with UIImageNamed. Can’t imagine how lots of effort and steps, and if the placeholder color are requested to be updated, you’d have to repeat the process all over again.

If you needed work with this kind of situations a lot, lets do it programmatically and DRY! Consider the following UIImage-JTColor category.

  

Usage:

#import "UIImage-JTColor.h"

UIColor *color = [UIColor lightGrayColor];   // Or your whatever UIColor
imageView.image = [UIImage imageWithColor:color];


Nothing magical but will saves you a lot of time.
