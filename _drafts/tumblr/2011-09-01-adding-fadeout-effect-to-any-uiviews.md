---
layout: post
title: Adding fadeout effect to any -[UIViews removeFromSuperview]
tags:
- ioscodesnippet
- objective-c
- UIView
- fadeout
- removeFromSuperview
- tutorial
---
Typically you like to do something like below when you wanted to remove a view from its parent view.

[myView removeFromSuperview];



Sometimes it’s not that please for a user to see an UI component disappearing suddenly. You’d then consider adding some transition effects, and here’s a little code snippet in the UIView+JTRemoveAnimated category for how you can get a fade out effect on view removal.

  

So from now on, you just needed to do this to fade out any UIViews

[myView removeFromSuperviewAnimated]
