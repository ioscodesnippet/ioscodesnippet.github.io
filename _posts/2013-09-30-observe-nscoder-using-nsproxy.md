--- 
layout: default
title: UINibDecoderProxy - Observes what's encoded in NSCoder object
name: UINibDecoderProxy
author: jamztang
publish: true
comments: true
description: false
tags:
- NSCoder
- get all keys
- decoding
- contains
- valueForKey
---

# {{ page.title }}

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
{% include Pods/UINibDecoderProxy/UINibDecoderProxy.m %}
```

Hopefully not too tricky.
