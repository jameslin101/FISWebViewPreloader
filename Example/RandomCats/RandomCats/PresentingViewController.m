//
//  PresentingViewController.m
//  WebViewPreloader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import "WebViewPreloader.h"
#import "PresentingViewController.h"


@interface PresentingViewController ()

@property (strong,nonatomic) WebViewPreloader *preloader;
@property (strong,nonatomic) UIWebView *randomWebView;
@end

@implementation PresentingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Presenting View Controller"];
 
    
//    [self.view removeConstraints:self.view.constraints];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:100]];
//    
//     [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]];
//    
//      [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startLoadingButtonPressed:(id)sender {
    
    self.preloader = [[WebViewPreloader alloc]init];
    
    for(int i = 0; i<15; i++)
    {
       
     NSString *randomURL = [NSString stringWithFormat:
                            @"http://thecatapi.com/api/images/get?format=src&type=png&blah=%i", i];
        
     UIWebView *webView = [self.preloader setURLString:randomURL
                          forKey:[NSNumber numberWithInt:i]
                  withFrameWidth:self.containerView.frame.size.width
                 withFrameLength:self.containerView.frame.size.height];
        
        webView.delegate = self;
    }
}

- (IBAction)fetchRandomSiteButtonPressed:(id)sender {
    
    [self.containerView.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    
    int randomNumber = arc4random_uniform(15);
    self.randomWebView = [self.preloader webViewForKey:[NSNumber numberWithInt:randomNumber]];
    
   [self.containerView addSubview:self.randomWebView];
    
 //   [self.randomWebView removeConstraints:self.randomWebView.constraints];
    
 //   [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.randomWebView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
    
   // [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.randomWebView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f]];
    
}

- (void)viewWillLayoutSubviews {
    
    [self.containerView.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    [self.randomWebView setFrame:self.containerView.bounds];
    [self.containerView addSubview:self.randomWebView];
    
}

#pragma mark UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"Started loading %@", [self.preloader keyForWebView:webView]);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Finished loading %@", [self.preloader keyForWebView:webView]);
}
@end
