//
//  WebViewPreloader.m
//  WebViewPreloader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import "WebViewPreloader.h"

@interface WebViewPreloader ()

@property (strong,nonatomic) NSMutableDictionary *preloadedWebViews;

@end


@implementation WebViewPreloader

- (id)init
{
    self = [super init];
    
    if(self)
    {
        _preloadedWebViews = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withFrameWidth:(double)aWidth withFrameLength:(double)aHeight
{
    
    NSURL *url = [NSURL URLWithString:aURLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
 
    UIWebView *preloadedWebView;
    
    if (aWidth > 0 && aHeight > 0) {
        preloadedWebView = [[UIWebView alloc]initWithFrame:(CGRectMake(0, 0, aWidth, aHeight))];
    }
    else {
        preloadedWebView = [[UIWebView alloc]init];
    }
    
    [preloadedWebView loadRequest:request];
    preloadedWebView.scalesPageToFit = YES;
    
    [self.preloadedWebViews setObject:preloadedWebView forKey:aKey];
        
    return preloadedWebView;
}


- (void)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey
{
    [self setURLString:aURLString forKey:aKey withFrameWidth:0.0 withFrameLength:0.0];
}

- (UIWebView *)webViewForKey:(id<NSCopying>)aKey
{
    return self.preloadedWebViews[aKey];
}

- (id)keyForWebView:(UIWebView *)webview {
    
    return [[self.preloadedWebViews allKeysForObject:webview] firstObject];
}

- (void)removeWebViewForKey:(id<NSCopying>)aKey
{
    UIWebView *webViewToRemove = [self webViewForKey:aKey];
    
    if ([webViewToRemove isLoading]) [webViewToRemove stopLoading];
    
    webViewToRemove = nil;
    
    [self.preloadedWebViews removeObjectForKey:aKey];
}

- (void)clear
{
    self.preloadedWebViews = [[NSMutableDictionary alloc] init];
}


@end
