--- 
layout: default
title: UINibDecoderProxy - Observes what's encoded in NSCoder object
name: UINibDecoderProxy
author: jamztang
publish: true
---

# {{ page.title }}

Sometimes you're wondering what are stored in an NSCoder instance?

There's a little utility exactly for this purpose, I called it `UINibDecoderProxy`. Here's how you use it:

```
#import "UINibDecoderProxy.h"

// Then override initWithCoder:
- (id)initWithCoder:(NSCoder *)aDecoder {
   self = [super initWithCoder:[[UINibDecoderProxy alloc] initWithTarget:aDecoder]];
   return self;
}
```

Now go to `UINibDecoderProxy.m` and set a break point at `-[UINibDecoderProxy forwardInvocation:]` and log the necessary information for you. Notice at the inline comment below:

```
{% include Pods/UINibDecoderProxy/UINibDecoderProxy.m %}
```

Not too tricky.
