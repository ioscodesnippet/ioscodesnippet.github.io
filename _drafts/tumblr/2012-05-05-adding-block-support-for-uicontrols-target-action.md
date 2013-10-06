---
layout: post
title: 'Adding Block support for UIControl''s Target-Action mechanism '
tags:
- UIControl
- blocks
- target-action
---
Tired of Target-Action? Welcome to the world of blocks.
  

Sample usage:

UIButton *button = ...;
[button addEventHandler:^(id sender, UIEvent *event) {
    NSLog(@"touchedUp!");
} forControlEvent:UIControlEventTouchUpInside];


This is a very simple implementation of adding block support for UIControls. Download the snippet from here, instantly saves you a few lines of code.

If you are finding for a more complex block addition of everything, you maybe interested to have a look at zwaldowski / BlocksKit.
