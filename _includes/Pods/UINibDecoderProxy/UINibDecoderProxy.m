/*
 * This file is part of the http://ioscodesnippet.com
 * (c) Jamz Tang <jamz@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UINibDecoderProxy.h"

@implementation UINibDecoderProxy {
    NSUInteger numberOfArguments;
}

- (id)initWithTarget:(id)target {
    _target = target;
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    // Set a breakpoint here add action "po invocation"

    for (NSUInteger i = 2; i < numberOfArguments; i++) {
        id argumment = nil;
        [invocation getArgument:&argumment atIndex:i];
        NSLog(@"argument %d %@", i, argumment);
    }
    [invocation invokeWithTarget:_target];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *methodSignature = [_target methodSignatureForSelector:sel];
    
    numberOfArguments = [methodSignature numberOfArguments];
    
    return methodSignature;
}

@end