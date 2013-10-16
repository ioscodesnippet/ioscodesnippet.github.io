---
layout: post
name: UIImage-JTImageCrop
title: Crop an image in specific rect
alias: [/post/10001584770/creating-an-image-of-image-in-specific-rect-or-by/index.html, /post/10001584770/crop-an-image-in-specific-rect/index.html]
comments: true
share: true
spec:
  homepage: https://gist.github.com/jamztang/6912933
  download: https://gist.github.com/jamztang/6912933/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/6912933.git
tags:
- UIImage
- crop
- create
- specific rect
- from rect
- ios
---

You probably aware of the method `CGImageCreateWithImageInRect` that's already defined in the Foundation framework. It is absolute fine for developers familiar well with CoreGraphics and doesn’t mind manually taking care of the image orientations.
We loved UIKit anyway.

Use this `UIImage-JTImageCrop` category instead.

{% gist 6912933 UIImage-JTImageCrop.h %}

{% gist 6912933 UIImage-JTImageCrop.m %}

Now you use this instead of the CoreGraphics method.

```objective-c
+ (UIImage *)imageWithImage:(UIImage *)image cropInRect:(CGRect)rect;
```

Last but not least, you’d somehow want to further abstract it with a proportional rect value. (Imagine you are defining a cropping area on the screen and want to crop a full sized image, you’d transform the visible area to the full sized photo).
A handly method is also created for this purpose.

```objective-c
+ (UIImage *)imageWithImage:(UIImage *)image cropInRelativeRect:(CGRect)rect;
```

Enjoy the snippet!
