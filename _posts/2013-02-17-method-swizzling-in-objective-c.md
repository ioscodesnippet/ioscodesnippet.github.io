---
layout: post
name: MethodSwizzle
title: Method Swizzling in Objective-C
comments: true
share: true
spec:
  name: MethodSwizzle
  version: 0.0.1
  homepage: https://gist.github.com/jamztang/4970366
  download: https://gist.github.com/jamztang/4970366/download
  source:
    git: git://gist.github.com/4970366.git
tags: 
- method
- swizzling
- ios
- method swizzle
- customsation
- hack
---

There are many reasons for you to use method swizzling, even if it's considered [harmful][1] and [dangerous][2].

Despite it's flaws, this little technique can be so powerful and let you reveal secrets of iOS like [status bar is drawn by the current app][3], and replace methods in class you don't own like [customizing UINavigationBar  background in old days][4] to achieve a higher level of UI customisation.

So here's the base snippet:

```objective-c
{% include submodules/MethodSwizzle/MethodSwizzle.h %}
```

```objective-c
{% include submodules/MethodSwizzle/MethodSwizzle.m %}
```

Example usage:

```objective-c
@implementation NSParagraphStyle (JTParagraphStyleDebug)

+ (void)load {
    SwizzleInstanceMethod([self class], @selector(initWithCoder:), @selector(initWithCoderSwizzled:));
}

// -[NSParagraphStyle initWithCoder:] is called when an NSAttributedString is specified in an UILabel in Interface Builder.
- (id)initWithCoderSwizzled:(NSCoder *)aDecoder {
    self = [self initWithCoderSwizzled:(id)[[UINibDecoderProxy alloc] initWithTarget:aDecoder]];
    return self;
}

@end
```  

Above code is extracted from [JTAttributedLabel][6] to use [UINibDecoderProxy][5] to diagnose NSAttributedString in Interface Builder.

Enjoy and have a good use with it!

[1]:http://zathras.de/angelweb/blog-method-swizzling-considered-harmful.htm

[2]:http://stackoverflow.com/questions/5339276/what-are-the-dangers-of-method-swizzling-in-objective-c

[3]:http://darkdust.net/writings/objective-c/method-swizzling

[4]:http://www.andyshep.org/2011/04/12/uinavigationbar-and-method-swizzling.html

[5]:https://gist.github.com/4466616

[6]:https://github.com/jamztang/JTAttributedLabel

