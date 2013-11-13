//
//  WebViewPreLoader.h
//  WebViewPreLoader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebViewPreLoaderDelegate <NSObject>
- (void)finishedPreloading:(UIWebView *)webview forUrlString:urlString;
@end

@interface WebViewPreLoader : NSObject
@property (nonatomic, weak) id <WebViewPreLoaderDelegate> delegate;


-(void) setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey;
-(UIWebView *) webViewForKey:(id<NSCopying>)aKey;
-(UIWebView *) setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withFrameWidth:(double)aWidth withFrameLength:(double)aHeight;
- (id)keyForWebView:(UIWebView *)webview;


@end
