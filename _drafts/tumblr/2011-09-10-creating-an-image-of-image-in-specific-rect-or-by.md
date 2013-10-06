---
layout: post
title: Creating an image of image in specific rect or by proportion
tags:
- ioscodesnippet
- UIImage
- cocoa
- tutorial
- objective-c
---
CGImageCreateWithImageInRect

That’s already defined in the Foundation framework. It is absolute fine for who already familiar well enough with CoreGraphics and doesn’t mind manually take care of the image orientation.
We loved UIKit anyway.
Use this UIImage+JTImageCrop category instead.
//
//  UIImage+JTImageCrop.h
//
//  Created by james on 9/8/11.
//  http://ioscodesnippet.tumblr.com
//

#import <UIKit/UIKit.h>


@interface UIImage (JTImageCrop)

+ (UIImage *)imageWithImage:(UIImage *)image cropInRect:(CGRect)rect;

// define rect in proportional to the target image.   
//
//  +--+--+
//  |A | B|
//  +--+--+
//  |C | D|
//  +--+--+
//
//  rect {0, 0, 1, 1} produce full image without cropping.
//  rect {0.5, 0.5, 0.5, 0.5} produce part D, etc.

+ (UIImage *)imageWithImage:(UIImage *)image cropInRelativeRect:(CGRect)rect;

@end

// Used by +[UIImage imageWithImage:cropInRelativeRect]
CGRect CGRectTransformToRect(CGRect fromRect, CGRect toRect);

//
//  UIImage+JTImageCrop.m
//
//  Created by james on 9/8/11.
//  http://ioscodesnippet.tumblr.com
//

#import "UIImage+JTImageCrop.h"


CGRect CGRectTransformToRect(CGRect fromRect, CGRect toRect) {
    CGPoint actualOrigin = (CGPoint){fromRect.origin.x * CGRectGetWidth(toRect), fromRect.origin.y * CGRectGetHeight(toRect)};
    CGSize  actualSize   = (CGSize){fromRect.size.width * CGRectGetWidth(toRect), fromRect.size.height * CGRectGetHeight(toRect)};
    return (CGRect){actualOrigin, actualSize};
}

@implementation UIImage (JTImageCrop)

+ (UIImage *)imageWithImage:(UIImage *)image cropInRect:(CGRect)rect {
    NSParameterAssert(image != nil);
    if (CGPointEqualToPoint(CGPointZero, rect.origin) && CGSizeEqualToSize(rect.size, image.size)) {
        return image;
    }

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1);
    [image drawAtPoint:(CGPoint){-rect.origin.x, -rect.origin.y}];
    UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return croppedImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image cropInRelativeRect:(CGRect)rect {
    NSParameterAssert(image != nil);
    if (CGRectEqualToRect(rect, CGRectMake(0, 0, 1, 1))) {
        return image;
    }
    
    CGRect imageRect = (CGRect){CGPointZero, image.size};
    CGRect actualRect = CGRectTransformToRect(rect, imageRect);
    return [UIImage imageWithImage:image cropInRect:CGRectIntegral(actualRect)];
}



Now you use this instead of the CoreGraphics method.
+ (UIImage *)imageWithImage:(UIImage *)image cropInRect:(CGRect)rect;


Last but not least, you’d somehow want to further abstract it with a proportional rect value. (Imagine you are defining a cropping area on the screen and want to crop a full sized image, you’d transform the visible area to the full sized photo).
A handly method is also created for this purpose.
+ (UIImage *)imageWithImage:(UIImage *)image cropInRelativeRect:(CGRect)rect;
 While you may be interested in more of it, go visit JTImageKit on GitHub! Documentations are raw right now, but welcome any comments!
