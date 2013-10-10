---
layout: post
name: NSArray-JTArraySplit
title: Splitting an array to several components
spec:
  homepage: https://gist.github.com/jamztang/6913749
  download: https://gist.github.com/jamztang/6913749/download
  license:
    type: MIT
  source:
    git: git://gist.github.com/6913749.git
tags:
- NSArray
- splitting
- split
- array
- several
- components
---

Say you’d like to split an array into several arrays each with a specific number of components.

```objective-c
// Say your originalArray is [@"A", @"B", @"C", @"D"]
NSArray *originalArray = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", nil];

// And we now want the array to be split into two arrays with two per segment
// like this [[@"A", @"B"], [@"C", @"D"]]
NSArray *newArray = [NSArray splitArray:originalArray componentsPerSegment:1];
```

And here’s the code snippet on how you can do it.

<script src="https://gist.github.com/6913749.js?file=NSArray-JTArraySplit.h"> </script>
<script src="https://gist.github.com/6913749.js?file=NSArray-JTArraySplit.m"> </script>

