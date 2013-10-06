---
layout: post
title: Force decompressing UIImage in background to achieve better performance
tags:
- ioscodesnippet
- iOS
- UIImage
- cocoa
- tutorial
---
If you’ve ever experience in loading lots of image in your app from the web, and display in a list form of UIImages in a table view, you’d properly heard of doing lazy loading those images. There are several great loading and caching open source solutions you’d probably already heard of such as SDWebImage, EGOImageLoading, etc.
However, you are still experience slight UI delay when the image finished loading or caching out from the disk. The reason behind is UIKit does extra lazy initialization, and only do expensive decompressing at the time to display or draw.
Here’s is code snippet meant to be load from a background thread that force an image to be decompressed into the right format, so that the system don’t have to do extra conversion on display.
//
//  UIImage+JTImageDecode.h
//
//  Created by james on 9/28/11.
//  http://ioscodesnippet.tumblr.com
//

@interface UIImage (JTImageDecode)
+ (UIImage *)decodedImageWithImage:(UIImage *)image;
@end



//
//  UIImage+JTImageDecode.m
//
//  Created by james on 9/28/11.
//  http://ioscodesnippet.tumblr.com
//

@implementation UIImage (JTImageDecode)

+ (UIImage *)decodedImageWithImage:(UIImage *)image {
    CGImageRef imageRef = image.CGImage;
    // System only supports RGB, set explicitly and prevent context error
    // if the downloaded image is not the supported format
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 CGImageGetWidth(imageRef),
                                                 CGImageGetHeight(imageRef),
                                                 8,
                                                 // width * 4 will be enough because are in ARGB format, don''t read from the image
                                                 CGImageGetWidth(imageRef) * 4,
                                                 colorSpace,
                                                 // kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little 
                                                 // makes system don''t need to do extra conversion when displayed.
                                                 kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little); 
    CGColorSpaceRelease(colorSpace);

    if ( ! context) {
        return nil;
    }
    
    CGRect rect = (CGRect){CGPointZero, CGImageGetWidth(imageRef), CGImageGetHeight(imageRef)};
    CGContextDrawImage(context, rect, imageRef);
    CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    
    UIImage *decompressedImage = [[UIImage alloc] initWithCGImage:decompressedImageRef];
    CGImageRelease(decompressedImageRef);
    return [decompressedImage autorelease];
}

@end 

So after an image has successfully loaded from the web or cached out, create an operation and decompress the image with 
[UIImage decodedImageWithImage:anImage];
And now you can achieve a smoother scrolling experience for your app.
You can also download UIImage+JTImageDecode directly on gist or checkout the optimized mystcolor/SDWebImage library on github.
