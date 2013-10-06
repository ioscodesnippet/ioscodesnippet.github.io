---
layout: post
title: Loading a Nib file programmatically using NSObject category
tags:
- UITableViewCell
- UIView
- category
- iOS
- loading nib file programmatically
- nib
- nsobject
- objective-c
- xib
---
Maybe you’ve an IB created uitableviewcell.xib, or some kind of uiview.xib wanted to load to your code-based view controller, and you come out finding it’s not that straight forward just to do this simple job according to the official Resource Programming Guide

Isn’t it ideal to load a nib file using one line like

MyCustomView *cell = [MyCustomView objectWithNibNamed:@"MyCustomViewNibName"];




Add this NSObject category make this possible

Easy enough?

Updates: 2013-09-17

Starting from iOS 5.0, loading a UITableViewCell is recommended to use the -[UITableView registerNib:forCellReuseIdentifier:] method.
