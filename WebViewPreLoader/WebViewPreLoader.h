//
//  WebViewPreloader.h
//  WebViewPreloader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebViewPreloader : NSObject 

-(void) setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey;
-(UIWebView *) webViewForKey:(id<NSCopying>)aKey;
-(UIWebView *) setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withFrameWidth:(double)aWidth withFrameLength:(double)aHeight;
- (id)keyForWebView:(UIWebView *)webview;


@end
