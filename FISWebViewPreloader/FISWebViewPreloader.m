//
//  FISWebViewPreloader.m
//  FISWebViewPreloader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import "FISWebViewPreloader.h"

@interface FISWebViewPreloader ()

@property (strong,nonatomic) NSMutableDictionary *preloadedFISWebViews;

@end


@implementation FISWebViewPreloader

- (id)init
{
    self = [super init];
    
    if(self)
    {
        _preloadedFISWebViews = [[NSMutableDictionary alloc]init];
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
    
    [self.preloadedFISWebViews setObject:preloadedFISWebView forKey:aKey];
        
    return preloadedFISWebView;
}


- (void)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey
{
    [self setURLString:aURLString forKey:aKey withFrameWidth:0.0 withFrameLength:0.0];
}

- (UIWebView *)FISWebViewForKey:(id<NSCopying>)aKey
{
    return self.preloadedFISWebViews[aKey];
}

- (id)keyForFISWebView:(UIWebView *)FISWebView {
    
    return [[self.preloadedFISWebViews allKeysForObject:FISWebView] firstObject];
}

- (void)removeFISWebViewForKey:(id<NSCopying>)aKey
{
    UIWebView *FISWebViewToRemove = [self FISWebViewForKey:aKey];
    
    if ([FISWebViewToRemove isLoading]) [FISWebViewToRemove stopLoading];
    
    FISWebViewToRemove = nil;
    
    [self.preloadedFISWebViews removeObjectForKey:aKey];
}

- (void)clear
{
    self.preloadedFISWebViews = [[NSMutableDictionary alloc] init];
}


@end
