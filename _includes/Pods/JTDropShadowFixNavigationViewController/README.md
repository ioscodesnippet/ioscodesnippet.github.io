# Using custom drop shadows in UINavigationBar (fix for iOS 6.1)

This is an update to the [Adding Drop Shadow on UINavigationBar](http://ioscodesnippet.com/post/10437516225/adding-drop-shadow-on-uinavigationbar) which was written prior to iOS 6.0

Since iOS 6.0 Apple introduced the `-[UINavigationBar shadowImage]` property. We should probably leverage that, which are also UIAppearance selectors.

    // Configure your images
    UIImage *background = [UIImage imageNamed:@"titlebar44"];
    UIImage *shadow = [UIImage imageNamed:@"titlebar-bottom-highlight"];

    // Using the appearance proxy
    // Note: setBackgroundImage:forBarMetrics has been documented to be
    // **compulsory** to enable the displaying of the custom shadow image.
    [[UINavigationBar appearance] setBackgroundImage:background forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:shadow];


You probably went with similar code, but the custom shadow just didn't show up, right?

The problem occurs because of the implementation on UINavigationBar, the clipsToBounds property is needed to be set to NO, and this step has been missing from the documentation. (At least I didn't find it)

Most probably you'll need to set self.navigationController.navigationBar.clipsToBounds = NO in every UIViewController subclass you wrote, a more convenience way is to subclass UINavigationController and have it do the job for you. And I've created a snippet for you.

<script src="https://gist.github.com/6591926.js?file=JTDropShadowFixNavigationViewController.h"> </script>
<script src="https://gist.github.com/6591926.js?file=JTDropShadowFixNavigationViewController.m"> </script>

So now you can initialise your view controllers in code like this:

    UIViewController *controller; // configure your view controller
    UINavigationController *navController = [[JTDropShadowFixNavigationViewController alloc] initWithRootViewController:controller];
  
Or if you use storyboard, simply change the subclass of your UINavigationController to JTDropShadowFixNavigationViewController.

![](https://gist.github.com/jamztang/6591926/raw/0437477ed7efd34a81bcc66a47de30c95071d7cb/modify-class.png)

**In fact there's an even simpler method you'll notice in the snippet.**

This is a hack that adds a category method to always set clipsToBounds to NO for UINavigationBar. Enable it defining this constant somewhere in your code (recommended in .pch):

    #define ENABLE_JTDROPSHADOW_GLOBAL_FIX 1

Let me know your thoughts!

Jamz

