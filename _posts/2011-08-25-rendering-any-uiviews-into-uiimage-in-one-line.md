--- 
layout: default
title: Rendering any UIViews into UIImage in one line
name: UIView+JTViewToImage
author: 
  github: jamztang
  twitter: jamztang
comments: true
share: true
desccription: A snippet to take snapshots on any views into image
tags: 
- render
- capture
- UIView
- to image
- UIImage
- iOS
- snapshot
- screenshot
- picture
- taking
- create
- take
---

Looks like you'd like to make some snapshots of your application, or maybe
capturing partial UI elements on the screen for caching or saving? You can
achieve this in just one single line like this.


```objective-c    
UIImage *viewSnapshot = [myView toImage];
```    


Add this UIView+JTViewToImage category to your project, and you'll also needed
to link &lt;QuartzCore/QuartzCore.h&gt; framework too.

{% gist 1578446 UIView%2BJTViewToImage.h %}
{% gist 1578446 UIView%2BJTViewToImage.m %}

In advance, if you want to make sure you've the exact size of the static image
output, try this line instead.


```objective-c    
UIImage *viewSnapshot = [myView toImageWithScale:1];
```

  
This will tell your app to ignore the screen scale and simply reference to the
size of the view bounds.

