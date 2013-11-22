#import <Foundation/Foundation.h>

@interface FISWebViewPreloader : NSObject

typedef enum {
    FIFO,
    LIFO
} ScheduleType;

@property (strong, nonatomic) NSMutableArray *priorityQueue;

- (id)initWithCapacity:(NSInteger)capacity scheduleType:(ScheduleType)schedule;

- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withCGRect:(CGRect)cgRect;
- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey;
- (UIWebView *)webViewForKey:(id<NSCopying>)aKey;

- (void)unloadWebViewForKey:(id<NSCopying>)aKey;

- (NSArray *)allKeys;
- (void)reset;

@end
