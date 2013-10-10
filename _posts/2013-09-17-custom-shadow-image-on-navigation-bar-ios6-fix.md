--- 
layout: default
title: Using custom drop shadows in UINavigationBar (fix for iOS 6.1)
name: JTDropShadowFixNavigationViewController
comments: true
spec:
  version: 0.0.1
  name: JTDropShadowFixNavigationViewController
  homepage: https://gist.github.com/jamztang/6591926
  download: https://gist.github.com/jamztang/6591926/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/6591926.git
description: Display custom shadow on UINavigationBar and fix for why it doesn't show up on iOS 6
alias: post/61487770156/custom-shadow-image-on-navigation-bar-ios6-fix
tags:
- create
- adding
- custom
- drop shadow
- setShadowImage
- iOS
- navigation bar
- UINavigationBar
- clipsToBounds
---

This is an update to the [Adding Drop Shadow on UINavigationBar](/post/10437516225/adding-drop-shadow-on-uinavigationbar) which was written prior to iOS 6.0

Since iOS 6.0 Apple introduced the `-[UINavigationBar shadowImage]` property. We should probably leverage that, which are also UIAppearance selectors.

```objective-c
// Configure your images
UIImage *background = [UIImage imageNamed:@"titlebar44"];
UIImage *shadow = [UIImage imageNamed:@"titlebar-bottom-highlight"];

// Using the appearance proxy
// Note: setBackgroundImage:forBarMetrics has been documented to be
// **compulsory** to enable the displaying of the custom shadow image.
[[UINavigationBar appearance] setBackgroundImage:background forBarMetrics:UIBarMetricsDefault];
[[UINavigationBar appearance] setShadowImage:shadow];
```

You probably went with similar code, but the custom shadow just didn't show up, right?

The problem occurs because of the implementation on UINavigationBar, the clipsToBounds property is needed to be set to NO, and this step has been missing from the documentation. (At least I didn't find it)

Most probably you'll need to set self.navigationController.navigationBar.clipsToBounds = NO in every UIViewController subclass you wrote, a more convenience way is to subclass UINavigationController and have it do the job for you. And I've created a snippet for you.

```objective-c
{% include submodules/JTDropShadowFixNavigationViewController/JTDropShadowFixNavigationViewController.h %}
```

```objective-c
{% include submodules/JTDropShadowFixNavigationViewController/JTDropShadowFixNavigationViewController.m %}
```

So now you can initialise your view controllers in code like this:

```objective-c
UIViewController *controller; // configure your view controller
UINavigationController *navController = [[JTDropShadowFixNavigationViewController alloc] initWithRootViewController:controller];
```
  
Or if you use storyboard, simply change the subclass of your UINavigationController to JTDropShadowFixNavigationViewController.

![](/images/2013-09-17-custom-shadow-image-on-navigation-bar-ios6-fix/modify-class.png)

> In fact there's an even simpler method you'll notice in the snippet.

This is a hack that adds a category method to always set clipsToBounds to NO for UINavigationBar. Enable it defining this constant somewhere in your code (recommended in .pch):

```objective-c
#define ENABLE_JTDROPSHADOW_GLOBAL_FIX 1
```

Let me know your thoughts!

