#UIWebView Preloader 
`FISWebViewPreloader` is Cocoapod which helps loading `UIWebView` objects in the background so they can be presented without delays.

---
#Installing FISWebViewPreloader
You can install `FISWebViewPreloader` in your project by using [CocoaPods](https://github.com/cocoapods/cocoapods):

```Ruby
pod 'FISWebViewPreloader', :git => 'https://github.com/jameslin101/FISWebViewPreloader.git'
```

---
#Using FISWebViewPreloader 
Using `FISWebViewPreloader` is very easy. We recommend creating a private variable to use `FISWebViewPreloader`:

```Objective-C
@property (strong,nonatomic) FISWebViewPreloader *preloader;
```

Any time you need to create a pre-loaded `UIWebView` object, you can add your URL string to `FISWebViewPreloader`'s dictionary. 

```Objective-C
[self.preloader setURLString:@"http://www.google.com" forKey:@"Google"];
```

If you need to scale the web pages to fit a certain frame, you can pass the Width and Length values of your frame:

```Objective-C
[self.preloader setURLString:@"http://www.apple.com"
                          forKey:@"Apple"
                  withFrameWidth:self.view.frame.size.width
                 withFrameLength:self.view.frame.size.height];
```

