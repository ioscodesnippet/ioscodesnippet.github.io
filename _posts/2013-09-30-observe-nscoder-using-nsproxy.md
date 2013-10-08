--- 
layout: default
title: Observes what's encoded in an NSCoder object
name: UINibDecoderProxy
comments: true
description: Sometimes you're wondering what are stored in an NSCoder instance? Here's a little utility exactly for this purpose, I called it `UINibDecoderProxy`.
spec:
  version: 0.0.1
  name: UINibDecoderProxy
  homepage: https://gist.github.com/jamztang/4466616
  download: https://gist.github.com/jamztang/4466616/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/4466616.git
tags:
- NSCoder
- get all keys
- decoding
- contains
- valueForKey
---

Sometimes you're wondering what are stored in an NSCoder instance?

Here's a little utility exactly for this purpose, I called it `UINibDecoderProxy`. This is how you use it:

```objective-c
#import "UINibDecoderProxy.h"

// Then override initWithCoder:
- (id)initWithCoder:(NSCoder *)aDecoder {
   self = [super initWithCoder:[[UINibDecoderProxy alloc] initWithTarget:aDecoder]];
   return self;
}
```

Now go to `UINibDecoderProxy.m` and set a break point at `-[UINibDecoderProxy forwardInvocation:]` and log the necessary information for you. Notice at the inline comment below:

```objective-c
{% include submodules/UINibDecoderProxy/UINibDecoderProxy.m %}
```

Hopefully not too tricky.
