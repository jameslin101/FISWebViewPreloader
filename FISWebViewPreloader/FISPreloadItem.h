#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FISPreloadItem : NSObject

@property (strong, nonatomic) NSString *URLString;
@property (strong, nonatomic) UIWebView *webView;
@property (assign) CGRect cgRect;

- (id)initWithURLString:(NSString *)aURLString
             withCGRect:(CGRect)cgRect;

- (void)loadWebView;
- (void)unloadWebView;

@end
