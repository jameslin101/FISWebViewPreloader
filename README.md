#UIWebView Preloader 
`FISWebViewPreloader` is Cocoapod which helps loading `UIWebView` objects in the background so they can be presented without delays.

---
##Installing FISWebViewPreloader
You can install `FISWebViewPreloader` in your project by using [CocoaPods](https://github.com/cocoapods/cocoapods):

```Ruby
pod 'FISWebViewPreloader', :git => 'https://github.com/jameslin101/FISWebViewPreloader.git'
```

---
##Using FISWebViewPreloader to create pre-loaded `UIWebView` objects 
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
---
##Accessing your pre-loaded `UIWebView` objects 

There are two ways of accessing the pre-loaded `UIWebView` objects. You can either retrieve your `UIWebView` object at the time of their creation: 

```Objective-C
UIWebView *googleWebView = [self.preloader setURLString:@"http://www.google.com" forKey:@"Google"];
```

Alternatively, you can use `FISWebViewPreloader`'s `webViewForKey:` method: 

```Objective-C
UIWebView *googleWebView = [self.preloader webViewForKey:@"Google"];
````

You can use the following method to access the key for a given `UIWebView`: 

```Objective-C
NSString *myKey = [self.preloader keyForWebView:googleWebView];
//myKey will be @"Google"
```

---
##`UIWebViewDelegate` Protocol: 

If your View Controller adheres to the `UIWebViewDelegate` protocol, then you can use a similar pattern to below to access delegate methods:

```Objective-C

-(void)createWebViews
{
    UIWebView *googleWebView = [self.preloader setURLString:@"http://www.google.com" forKey:@"Google"];
    googleWebView.delegate = self;
}

#pragma mark UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"Started loading %@", [self.preloader keyForWebView:webView]);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Finished loading %@", [self.preloader keyForWebView:webView]);
}
```


---
##Removing pre-loaded `UIWebView` objects

You can call the `removeWebViewForKey:` method to stop the destroy any `UIWebView` objects that you no longer need: 

```Objective-C
[self.preloader removeWebViewForKey:@"Google"];
```

You can also call the `clear:` method to destroy all key/object pairs preloader: 

```Objective-C
[self.preloader clear];
```



