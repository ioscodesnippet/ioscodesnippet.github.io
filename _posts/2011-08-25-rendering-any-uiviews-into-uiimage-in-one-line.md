--- 
layout: default
title: Rendering any UIViews into UIImage in one line (updated with iOS 7 support)
name: UIView-JTViewToImage
comments: true
share: true
description: Rendering any UIViews into UIImage in one line (updated with iOS 7 support)
updated: 2013-10-14
spec:
  version: 0.1
  name: UIView-JTViewToImage
  homepage: https://github.com/ioscodesnippet/UIView-JTViewToImage
  download: https://github.com/ioscodesnippet/UIView-JTViewToImage/archive/master.zip
  license:
    type: MIT
  source:
    git: https://github.com/ioscodesnippet/UIView-JTViewToImage.git
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

```objective-c
{% include submodules/UIView-JTViewToImage/Classes/UIView-JTViewToImage.h %}
```

```objective-c
{% include submodules/UIView-JTViewToImage/Classes/UIView-JTViewToImage.m %}
```

{% comment %}
{% gist 1578446 UIView-JTViewToImage.h %}
{% gist 1578446 UIView-JTViewToImage.m %}
{% endcomment %}

In advance, if you want to make sure you've the exact size of the static image
output, try this line instead.


```objective-c    
UIImage *viewSnapshot = [myView toImageWithScale:1];
```

  
This will tell your app to ignore the screen scale and simply reference to the
size of the view bounds.

> Updated: 2013-10-14

With iOS 7 faster API, the screen capturing method is about 1.8x faster on my iPhone 5. Actual time elasped was down from 0.09s to 0.05 seconds. Clone the repository to test it in action.

