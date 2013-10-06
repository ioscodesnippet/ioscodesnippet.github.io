---
layout: post
title: Revisiting KVO+Block, the simplest version.
tags:
- kvo
- blocks
---
There have been a good number of attempts solving the “broken” Key Value Observing official API.

And we get solutions like custom notification centre replacement, extra target-action based observation, handly marcos, trampoline…?, mixin context for selector, wah, and one that can’t even find the link to the repo, etc.

But come on, just because I need to subclass one 3rd party library that already implements the -[NSObject observeValueForKeyPath:ofObject:change:context:]… all I want is a tiny wrapper that allows me stay away from that method.

I don’t want any overheads to the base NSObject due to custom category methods; I don’t want solutions hacking around with associative objects, I just want a just enough solution for that particular hassle, please…

To remove observer earlier? Just nil the properly, you know ;P
