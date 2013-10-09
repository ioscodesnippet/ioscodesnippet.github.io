---
layout: post
name: UIImage+JTImageDecode
title: Force decompressing UIImage in background to achieve better performance
spec:
  homepage: https://gist.github.com/jamztang/1257111
  download: https://gist.github.com/jamztang/1257111/download
  source:
    git: git://gist.github.com/1257111.git
tags:
- background
- decode image
- UIImage
- iOS
---

If you’ve ever experience in loading lots of image in your app from the web, and display in a list form of UIImages in a table view, you’d properly heard of doing lazy loading those images. There are several great loading and caching open source solutions you’d probably already heard of such as SDWebImage, EGOImageLoading, etc.

However, you are still experience slight UI delay when the image finished loading or caching out from the disk. The reason behind is UIKit does extra lazy initialization, and only do expensive decompressing at the time to display or draw.
Here’s is code snippet meant to be load from a background thread that force an image to be decompressed into the right format, so that the system don’t have to do extra conversion on display.

<script src="https://gist.github.com/1257111.js?file=UIImage%2BJTImageDecode.h"> </script>
<script src="https://gist.github.com/1257111.js?file=UIImage%2BJTImageDecode.m"> </script>

So after an image has successfully loaded from the web or cached out, create an operation and decompress the image with 
```objective-c
[UIImage decodedImageWithImage:anImage];
```

And now you can achieve a smoother scrolling experience for your app.
Checkout [rs / SDWebImage] library which already contains the optimization on github.

[rs / SDWebImage]:https://github.com/rs/SDWebImage
