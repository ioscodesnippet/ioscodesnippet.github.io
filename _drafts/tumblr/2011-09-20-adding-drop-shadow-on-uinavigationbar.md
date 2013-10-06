---
layout: post
title: Adding drop shadow on UINavigationBar
tags:
- ioscodesnippet
- tutorial
- UINavigationBar
- dropshadow
- objective-c
- cocoa
---
Somehow adding drop shadows on UINavigationBar using the CALayer property fails for me but I later find it out we just need a little trick there.



// The magic is to have -[UIView clipToBounds] set to NO
self.navigationController.navigationBar.clipsToBounds = NO;








Base on the fact this is ioscodesnippet, I know I have to make a really simple UINavigationBar+JTDropShadow category to make our life more easier.



//
//  UINavigationBar+JTDropShadow.h
//
//  Created by james on 9/20/11.
//  http://ioscodesnippet.tumblr.com
//


#import 

@interface UINavigationBar (JTDropShadow)

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity;


@end




//
//  UINavigationBar+JTDropShadow.m
//
//  Created by james on 9/20/11.
//  http://ioscodesnippet.tumblr.com
//


#import "UINavigationBar+JTDropShadow.h"

#import 



@implementation UINavigationBar (JTDropShadow)

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color 
                     opacity:(CGFloat)opacity {

    // Creating shadow path for better performance
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    self.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);

    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;

    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
    self.clipsToBounds = NO;

}

@end








Usage:




- (void)viewDidLoad {
    [super viewDidLoad];
    ...
    [self.navigationController.navigationBar dropShadowWithOffset:CGSizeMake(0, 3)
                                                           radius:1
                                                            color:[UIColor darkGrayColor]
                                                          opacity:1];
    ...
}








Don’t forget to import QuartzCore.framework in your build settings.



While it is more generic by making it a UIView category, but I’ll leave it simple here to demonstrate the main purpose.



How about a screenshot this time? ;P





Make sure you also see the follow up post for iOS 6+ Using custom drop shadows in UINavigationBar (fix for iOS 6.1)
