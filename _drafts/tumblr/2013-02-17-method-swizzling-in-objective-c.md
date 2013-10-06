---
layout: post
title: Method Swizzling in Objective-C
tags: 
---
There are many reasons for you to use method swizzling, even if it’s considered harmful and dangerous.

Despite it’s flaws, this little technique can be so powerful and let you reveal secrets of iOS like status bar is drawn by the current app, and replace methods in class you don’t own like customizing UINavigationBar  background in old days to achieve a higher level of UI customisation.

So here’s the base snippet:

 Example usage:

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


Above code is extracted from JTAttributedLabel to use UINibDecoderProxy to diagnose NSAttributedString in Interface Builder.

Enjoy and have a good use with it!
