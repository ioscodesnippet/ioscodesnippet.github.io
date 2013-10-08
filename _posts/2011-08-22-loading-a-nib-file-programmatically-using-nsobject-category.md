--- 
layout: post
name: NSObject-JTNibLoader
title: Loading a Nib file programmatically using NSObject category
comments: true
share: true
spec:
  version: 0.0.1
  name: NSObject-JTNibLoader
  homepage: https://gist.github.com/jamztang/1578429
  download: https://gist.github.com/jamztang/1578429/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/1578429.git
tags: 
- iOS
- loading nib file programmatically
- nib
- nsobject
- xib
---

Maybe you've an IB created uitableviewcell.xib, or some kind of uiview.xib
wanted to load to your code-based view controller, and you come out finding
it's not that straight forward just to do this simple job according to the
official [Resource Programming Guide](http://developer.apple.com/library/ios/#
documentation/Cocoa/Conceptual/LoadingResources/CocoaNibs/CocoaNibs.html)

Isn't it ideal to load a nib file using one line like

```objective-c
MyCustomView *cell = [MyCustomView objectWithNibNamed:@"MyCustomViewNibName"];
```

Add this NSObject category make this possible

```objective-c
{% include submodules/NSObject-JTNibLoader/NSObject-JTNibLoader.h %}
```
```objective-c
{% include submodules/NSObject-JTNibLoader/NSObject-JTNibLoader.m %}
```

Easy enough?

Updates: 2013-09-17

Starting from iOS 5.0, loading a UITableViewCell is recommended to use the `-[UITableView registerNib:forCellReuseIdentifier:] method.`
