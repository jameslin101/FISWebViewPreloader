#import "FISPreloadItem.h"

@implementation FISPreloadItem


- (id)initWithURLString:(NSString *)aURLString
             withCGRect:(CGRect)cgRect
{
    
    self = [super init];
    
    if (self) {
        _URLString = aURLString;
        _cgRect = cgRect;

        [self loadWebView];
    }
    
    return self;
}

- (UIWebView *)webView
{
    if (!_webView) {
        [self loadWebView];
    }
    return _webView;
}

- (void)loadWebView
{
    NSURL *url = [NSURL URLWithString:_URLString];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    _webView= [[UIWebView alloc] initWithFrame:self.cgRect];
    [_webView loadRequest:request];
    _webView.scalesPageToFit = YES;

}

- (void)unloadWebView
{
    _webView = nil;
}


@end
