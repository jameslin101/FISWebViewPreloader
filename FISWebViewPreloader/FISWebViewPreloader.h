#import <Foundation/Foundation.h>


/** The `FISWebViewPrelaoder` class manages the execution of preloading of `UIWebView` objects. 
 * User can add `UIWebView` objects using its public methods and the added views will be preloaded.  
 *
 * By default, it accepts an unlimited amount of `UIWebView` objects for preloading. It also supports 
 * limiting the `UIWebView` capacity for memory management concerns. 
 */
@interface FISWebViewPreloader : NSObject

/**-----------------------------------------------------------------------------
 * @name ScheduleType enumaration for scheduling of `UIWebView` objects
 * -----------------------------------------------------------------------------
 */

 /** Lets the user define the schedule of `UIWebView` objects to be removed when capacity is reached. */
typedef enum {
    FIFO,
    LIFO
} ScheduleType;


/**-----------------------------------------------------------------------------
 * @name Initializing 
 * -----------------------------------------------------------------------------
 */

 /**Internal queue to determine which `UIWebView` to remove if the capacity is reached. */
@property (strong, nonatomic) NSMutableArray *priorityQueue;

/**Initalizer which accepts capacity and ScheduleType parameters. */
- (id)initWithCapacity:(NSInteger)capacity scheduleType:(ScheduleType)schedule;

/**-----------------------------------------------------------------------------
 * @name Adding, removing and retrieving `UIWebView` objects. 
 * -----------------------------------------------------------------------------
 */

 /**Add `UIWebView` for preloading with `CGRect` definition
  *
  * @param aURLString The URL string for the `UIWebView`
  * @param aKey Key to identify the `UIWebView`
  * @param cgRect `CGRect` definition for the `UIWebView`
  **/
- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey withCGRect:(CGRect)cgRect;

/**Add 'UIWebView' for preloading
 *
 * @param aURLString The URL string for the `UIWebView`
 * @param aKey Key to identify the `UIWebView`
 */
- (UIWebView *)setURLString:(NSString *)aURLString forKey:(id<NSCopying>)aKey;

/**Retrieve preloaded `UIWebView`
 *
 *@param aKey Key to identify the requested `UIWebView`
 */
- (UIWebView *)webViewForKey:(id<NSCopying>)aKey;

/**Removes a `UIWebView` from queue. 
 *
 *@param aKey Key to identify the `UIWebView` to unload. 
 */
- (void)unloadWebViewForKey:(id<NSCopying>)aKey;

/**Returns all stored keys for preloaded `UIWebView` ojbects.*/
- (NSArray *)allKeys;

/**Removes all preloaded `UIWebView` objects.*/
- (void)reset;

@end
