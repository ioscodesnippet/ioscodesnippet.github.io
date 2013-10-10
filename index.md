--- 
layout: default
title: Welcome
comments: false
description: "Self contained inspiring little pieces on iOS development. Now available on ioscodesnippet Cocoapods repo."
image: cover.jpg
follow: true
sharing: false
type: website
tags:
- ioscodesnippet
- cocoapods
- tips
- development
- ios
- code snippet
- tricks
- opensource
- resource
---

![](/images/cover.jpg)

`ioscodesnippet.com` is a collection of self contained inspiring little pieces on iOS development. Most code snippets here can be installed easily through our public [ioscodesnippet / Spec][1] CocoaPods custom repo.

There's something new here:

- New CocoaPods integration
- Quick Installation section
- Responsive design

Start using CocoaPods
---

To configure the ioscodesnippet custom repo, run this once.

    $ pod repo add ioscodesnippet https://github.com/ioscodesnippet/Specs.git

Create a `Podfile` for your project.

    $ edit Podfile
    platform :ios, '6.0'
    pod 'UIView-JTViewToImage', '~> 0.0.1'
    pod 'UIImage-JTColor'

Remove and add the lines you needed in your Podfile, then you can run:

    $ pod install

You'll be instructed to open the project with `yourproject.xcworkspace`.

---

### Don't have CocoaPods? 

[Learn more][Cocoapods], or you can browse our [original usage guide][1].

[1]: usage
[Cocoapods]:https://github.com/CocoaPods/CocoaPods
