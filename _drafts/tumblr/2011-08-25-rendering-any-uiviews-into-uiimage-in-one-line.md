---
layout: post
title: Rendering any UIViews into UIImage in one line
publish: false
tags:
- ioscodesnippet
- UIView
- category
- objective-c
- UIImage
- render
- iOS
---
Looks like you’d like to make some snapshots of your application, or maybe capturing partial UI elements on the screen for caching or saving? You can achieve this in just one single line like this.

UIImage *viewSnapshot = [myView toImage];




Add this UIView+JTViewToImage category to your project, and you’ll also needed to link 
<QuartzCore/QuartzCore.h> framework too.

//
//  UIView+JTViewToImage.h
//
//  Created by James Tang on 25/08/2011.
//  http://ioscodesnippet.tumblr.com/
//

#import <UIKit/UIKit.h>

@interface UIView (JTViewToImage)

// - [UIImage toImage]
//
// Follow device screen scaling. If your view is sized 320 * 480, 
// it renders 320 * 480 on non-retina display devices, 
// and 640 * 960 on retina display devices
// Use this option for making high resolution view elements snapshots to display on retina devices
- (UIImage *)toImage;

// - [UIImage toImageWithScale]
//
// Force rendering in a given scale. Commonly used will be "1".
// Good for output or saving a static image with the exact size of the view element.
- (UIImage *)toImageWithScale:(CGFloat)scale;

@end



//
//  UIView+JTViewToImage.m
//
//  Created by James Tang on 25/08/2011.
//  http://ioscodesnippet.tumblr.com/
//

#import "UIView+JTViewToImage.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (JTViewToImage)

- (UIImage *)toImage {
    return [self toImageWithScale:0];
}

- (UIImage *)toImageWithScale:(CGFloat)scale {
    // If scale is 0, it''ll follows the screen scale for creating the bounds
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, scale);
    
    // - [CALayer renderInContext:] also renders subviews 
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];

    // Get the image out of the context
    UIImage *copied = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    // Return the result
    return copied;
}

@end





In advance, if you want to make sure you’ve the exact size of the static image output, try this line instead.

UIImage *viewSnapshot = [myView toImageWithScale:1];



This will tell your app to ignore the screen scale and simply reference to the size of the view bounds.
