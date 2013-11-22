#import <Foundation/Foundation.h>

@interface FISWebViewPreloader : NSObject

@property (strong, nonatomic) NSMutableArray *priorityQueue;

- (id)initWithCapacity:(NSInteger)capacity;

- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withCGRect:(CGRect)cgRect;
- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey;
- (UIWebView *)webViewForKey:(id<NSCopying>)aKey;

- (void)unloadWebViewForKey:(id<NSCopying>)aKey;

- (NSArray *)allKeys;
- (void)reset;

@end
