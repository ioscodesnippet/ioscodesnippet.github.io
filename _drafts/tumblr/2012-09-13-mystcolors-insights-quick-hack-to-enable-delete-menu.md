---
layout: post
title: 'MYSTCOLOR''S INSIGHTS: Quick hack to enable delete menu item in UITableView
  menuController'
tags:
- UIMenuController
- iOS
- hack
- UITableView
---
MYSTCOLOR''S INSIGHTS: Quick hack to enable delete menu item in UITableView menuControllermystcolor:


 - (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath { return YES;
} - (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender { NSLog(@"%@",...
