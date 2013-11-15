//
//  FISWebViewPreloader.h
//  FISWebViewPreloader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISWebViewPreloader : NSObject

-(void) setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey;
-(UIWebView *) FISWebViewForKey:(id<NSCopying>)aKey;
-(UIWebView *) setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withFrameWidth:(double)aWidth withFrameLength:(double)aHeight;
- (id)keyForWebView:(UIWebView *)WebView;


@end
