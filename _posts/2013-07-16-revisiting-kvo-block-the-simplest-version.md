---
layout: post
title: Revisiting KVO+Block, the simplest version.
name: JTKeyValueObserver
spec:
  name: JTKeyValueObserver
  version: 0.0.1
  homepage: https://gist.github.com/jamztang/6009092
  download: https://gist.github.com/jamztang/6009092/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/6009092.git
tags:
- kvo
- blocks
- observeValueForKeyPath
---

There have been a good number of attempts solving the "broken" Key Value Observing official API.

And we get solutions like [custom notification centre replacement][1], [extra target-action based observation][5], [handly marcos][2], [trampoline...?][4], [mixin context for selector, wah][6], and [one that can't even find the link to the repo][5], etc.

But come on, just because I need to subclass one 3rd party library that already implements the `-[NSObject observeValueForKeyPath:ofObject:change:context:]`... all I want is a tiny wrapper that allows me stay away from that method.

I don't want any overheads to the base NSObject due to custom category methods; I don't want solutions hacking around with associative objects, I just want a just enough solution for that particular hassle, please...

```objective-c
{% include submodules/JTKeyValueObserver/JTKeyValueObserver.h %}
```

```objective-c
{% include submodules/JTKeyValueObserver/JTKeyValueObserver.m %}
```

To remove observer earlier? Just nil the properly, you probably already knew ;P

[1]:http://www.mikeash.com/pyblog/key-value-observing-done-right.html

[2]:https://github.com/iMartinKiss/Block-KVO

[5]:http://blog.andymatuschak.org/post/156229939/kvo-blocks-block-callbacks-for-cocoa-observers

[4]:https://gist.github.com/Abizern/787997

[3]:https://github.com/th-in-gs/THObserversAndBinders

[6]:https://github.com/zhangchiqing/KVOHelper


