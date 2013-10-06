---
layout: post
title: 'KVO+Blocks: Block Callbacks for Cocoa Observers'
tags: 
---
KVO+Blocks: Block Callbacks for Cocoa Observersandymatuschak:

Panther introduced Key-Value Observing, a Cocoa implementation of the observer pattern. It’s very useful, but the API kind of sucks.
To get observation notices, you have to override a lengthy selector (observeValueForKeyPath:ofObject:change:context:), provide a static context pointer, and essentially implement a big switch statement on the key path.
That’s unwieldy, but I think it also makes for unmaintainable code: the callbacks end up thrown in the same method, and they’re separated from the observer registration.
KVO+Blocks is an NSObject category I wrote which provides addObserverForKeyPath:task:, where the latter parameter is a block.
So, before KVO+Blocks:
const static NSString *SomeValueObservationContext =
    @"org.andymatuschak.SomeValueObservationContext";

- (void)registerObservation
{
    [observee addObserver:self
	       forKeyPath:@"someValue"
	          options:0
	          context:SomeValueObservationContext]
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (context == SomeValueObservationContext &&
        [keyPath isEqualToString:@"someValue"])
    {
        NSLog(@"someValue changed: %@", change);
    }
    else
    {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

- (void)dealloc
{
    [observee removeObserver:self forKeyPath:@"someValue"];
    [super dealloc];
}
And after:
- (void)registerObservation
{
    [observee addObserverForKeyPath:@"someValue"
                               task:^(id obj, NSDictionary *change) {
        NSLog(@"someValue changed: %@", change);
    }];
}
Note that you don’t even need to unregister your observer if you’re using GC; it’s handled for you when the observee is released. If you want to unregister early, or you’re using retain-counted code, there’s API for that too.
Blocks make life happy, ladies and gentlemen. More on this later.
Update: more notes and gotchas.
