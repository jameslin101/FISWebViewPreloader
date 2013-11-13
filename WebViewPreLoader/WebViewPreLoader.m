//
//  WebViewPreLoader.m
//  WebViewPreLoader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import "WebViewPreLoader.h"

@interface WebViewPreLoader ()

@property (strong,nonatomic) NSMutableDictionary *preLoadedWebViews;

@end


@implementation WebViewPreLoader

- (id)init
{
    self = [super init];
    
    if(self)
    {
        _preLoadedWebViews = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withFrameWidth:(double)aWidth withFrameLength:(double)aHeight
{
    
    NSURL *url = [NSURL URLWithString:aURLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
 
    UIWebView *preLoadedWebView;
    
    if (aWidth > 0 && aHeight > 0) {
        preLoadedWebView = [[UIWebView alloc]initWithFrame:(CGRectMake(0, 0, aWidth, aHeight))];
    }
    else {
        preLoadedWebView = [[UIWebView alloc]init];
    }
    
    [preLoadedWebView loadRequest:request];
    preLoadedWebView.scalesPageToFit = YES;
    
    [self.preLoadedWebViews setObject:preLoadedWebView forKey:aKey];

    preLoadedWebView.delegate = self;
        
    return preLoadedWebView;
}


- (void)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey
{
    [self setURLString:aURLString forKey:aKey withFrameWidth:0.0 withFrameLength:0.0];
}

- (UIWebView *)webViewForKey:(id<NSCopying>)aKey
{
    return self.preLoadedWebViews[aKey];
}

- (id)keyForWebView:(UIWebView *)webview {
    
    return [[self.preLoadedWebViews allKeysForObject:webview] firstObject];
}

- (void)removeWebViewForKey:(id<NSCopying>)aKey
{
    UIWebView *webViewToRemove = [self webViewForKey:aKey];
    
    if ([webViewToRemove isLoading]) [webViewToRemove stopLoading];
    
    webViewToRemove = nil;
    
    [self.preLoadedWebViews removeObjectForKey:aKey];
}

- (void)clear
{
    self.preLoadedWebViews = [[NSMutableDictionary alloc] init];
}

#pragma mark UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"start loading %@", [self keyForWebView:webView]);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"stop loading %@", [self keyForWebView:webView]);
}
@end
