//
//  FISWebViewPreloader.m
//  FISWebViewPreloader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import "FISWebViewPreloader.h"

@interface FISWebViewPreloader ()

@property (strong,nonatomic) NSMutableDictionary *preloadWebViews;

@end


@implementation FISWebViewPreloader

- (id)init
{
    self = [super init];
    
    if(self)
    {
        _preloadWebViews = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withFrameWidth:(double)aWidth withFrameLength:(double)aHeight
{
    
    NSURL *url = [NSURL URLWithString:aURLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
 
    UIWebView *preloadedFISWebView;
    
    if (aWidth > 0 && aHeight > 0) {
        preloadedFISWebView = [[UIWebView alloc]initWithFrame:(CGRectMake(0, 0, aWidth, aHeight))];
    }
    else {
        preloadedFISWebView = [[UIWebView alloc]init];
    }
    
    [preloadedFISWebView loadRequest:request];
    preloadedFISWebView.scalesPageToFit = YES;
    
    [self.preloadWebViews setObject:preloadedFISWebView forKey:aKey];
        
    return preloadedFISWebView;
}


- (void)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey
{
    [self setURLString:aURLString forKey:aKey withFrameWidth:0.0 withFrameLength:0.0];
}

- (UIWebView *)webViewForKey:(id<NSCopying>)aKey
{
    return self.preloadWebViews[aKey];
}

- (id)keyForWebView:(UIWebView *)webView {
    
    return [[self.preloadWebViews allKeysForObject:webView] firstObject];
}

- (void)removeWebViewForKey:(id<NSCopying>)aKey
{
    UIWebView *webViewToRemove = [self webViewForKey:aKey];
    
    if ([webViewToRemove isLoading]) [webViewToRemove stopLoading];
    
    webViewToRemove = nil;
    
    [self.preloadWebViews removeObjectForKey:aKey];
}

- (void)clear
{
    self.preloadWebViews = [[NSMutableDictionary alloc] init];
}


@end
