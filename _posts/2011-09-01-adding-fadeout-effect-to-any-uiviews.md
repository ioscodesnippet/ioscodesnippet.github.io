---
layout: post
name: UIView+JTRemoveAnimated
title: Adding fadeout effect to any -[UIViews removeFromSuperview]
spec:
  homepage: https://gist.github.com/jamztang/1259860
  download: https://gist.github.com/jamztang/1259860/download
  source:
    git: git://gist.github.com/1259860.git
tags:
- UIView
- fadeout
- removeFromSuperview
- animation
---

Typically you like to do something like below when you wanted to remove a view from its parent view.

```objective-c
[myView removeFromSuperview];
```

Sometimes it's not that please for a user to see an UI component disappearing suddenly. You'd then consider adding some transition effects, and here's a little code snippet in the UIView+JTRemoveAnimated category for how you can get a fade out effect on view removal.

<script src="https://gist.github.com/1259860.js?file=UIView%2BJTRemoveAnimated.h"> </script>
<script src="https://gist.github.com/1259860.js?file=UIView%2BJTRemoveAnimated.m"> </script>

So from now on, you just needed to do this to fade out any UIViews

```objective-c
[myView removeFromSuperviewAnimated]
```
