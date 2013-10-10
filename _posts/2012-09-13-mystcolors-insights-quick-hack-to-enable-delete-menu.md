---
layout: post
name: UITableViewDeleteActionResponder
comments: true
share: true
title: Quick hack to enable delete menu item in UITableView menuController
updated: 2013-10-10
spec:
  homepage: https://gist.github.com/jamztang/3009826
  download: https://gist.github.com/jamztang/3009826/download
  source:
    git: git://gist.github.com/3009826.git
tags:
- UIMenuController
- iOS
- hack
- UITableView
---

![](http://media.tumblr.com/tumblr_m6cwfvZgPE1qd122y.png)

    - (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
        return YES;
    }

    - (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
        NSLog(@"%@", NSStringFromSelector(action));
        return YES;
    }

    - (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    }

Watch carefully, there is a problem. So you found yourself returning YES for all of the actions including the `delete:` selector, and the delete item just doesn't show up.

To properly fix it, you should really [subclass your UITableViewCell](http://stackoverflow.com/questions/2487844/simple-way-to-show-the-copy-popup-on-uitableviewcells-like-the-address-book-ap) and implement your own `delete:` method.

But if you would like a really quick hack for all of your default tableViewCell, you can do it with category and implements the `delete:` method. 

<script src="https://gist.github.com/3009826.js?file=UITableViewDeleteActionResponder.m"> </script>

---

After the import of snippets:

    // By only returning YES for delete menu item, we can get the results like the screenshot down below.
    - (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action
    forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
        return action == @selector(delete:);
    }

![](http://media.tumblr.com/tumblr_m6cxc1Aeml1qd122y.png)

The category also helps you to route the `delete:` selector to your tableViewDelegate's `tableView:performAction:forRowAtIndexPath:withSender:` method, so you can handle it like all other actions. 


> Updated: 30 June 2012

The version you see above, I considered as a more elegant version for it's clever use of responder chain. Worth a look to the old [naive version][] if you're digging down to the ground.

This is revised version from the old [blog post](http://mystcolor.me/post/26114988122/show-delete-menu-item-in-tableview).
[naive version]:https://gist.github.com/3009826/a5c8136f8d6bdaee3f2da906ef50607a89ba3880 
