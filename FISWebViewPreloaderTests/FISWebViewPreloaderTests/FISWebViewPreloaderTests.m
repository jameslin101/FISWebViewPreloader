//
//  FISWebViewPreloaderTests.m
//  FISWebViewPreloaderTests
//
//  Created by Chemin Lin on 11/18/13.
//
//

#import <XCTest/XCTest.h>
#import "FISWebViewPreloader.h"

@interface FISWebViewPreloaderTests : XCTestCase
@property FISWebViewPreloader *preloader;
@end

@implementation FISWebViewPreloaderTests

- (void)setUp
{
    [super setUp];
    self.preloader = [[FISWebViewPreloader alloc] init];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSetURLString
{
    //Needs to run everything in main thread since they instantiates UIKit objects which are not threadsafe
    [self helperSetURLString];
    dispatch_async(dispatch_get_main_queue(), ^{
        XCTAssertTrue([self.preloader webViewForKey:@"google"] != nil, @"testSetURL did not set WebView");
    });
    
}


- (void)testWebViewForKey
{
    [self helperSetURLString];
    dispatch_async(dispatch_get_main_queue(), ^{
        XCTAssertTrue([[self.preloader webViewForKey:@"google"] isMemberOfClass:[UIWebView class]], @"webViewForKey did not returns an instance of WebView");
    });
}


- (void)testUnloadWebViewForKey
{
    [self helperSetURLString];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.preloader unloadWebViewForKey:@"google"];
        XCTAssertTrue([self.preloader webViewForKey:@"google"] == nil, @"removeWebViewForKey did not remove the webView");
    });
}

- (void)testClear
{
    [self helperSetURLString];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.preloader reset];
        XCTAssertTrue([[self.preloader allKeys] isEqualToArray:@[]], @"clear did not clear out the preloader");
    });
}

#pragma mark Helper Methods

- (void)helperSetURLString {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.preloader setURLString:@"http://google.com" forKey:@"google" withCGRect:CGRectMake(0, 0, 50, 50)];
    });
}


@end
