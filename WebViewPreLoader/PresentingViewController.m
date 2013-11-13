//
//  PresentingViewController.m
//  WebViewPreLoader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import "PresentingViewController.h"
#import "WebViewPreLoader.h"
#import "DetailsViewController.h"


@interface PresentingViewController ()

@property (strong,nonatomic) WebViewPreLoader *preLoader;

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
    
    // Do any additional setup after loading the view from its nib.
}

-(void)preLoadWebViews
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (IBAction)showCnnPressed:(id)sender {
//    UIWebView *cnnWebView = [self.preLoader webViewForKey:@"CNN"];
//    
//    DetailsViewController *dvc = [[DetailsViewController alloc] init];
//    dvc.webView = cnnWebView;
//    
//    [self.navigationController pushViewController:dvc animated:YES];
//    
//}
//
//- (IBAction)showRedditPressed:(id)sender {
//    
//    UIWebView *redditWebView = [self.preLoader webViewForKey:@"Reddit"];
//    
//    DetailsViewController *dvc = [[DetailsViewController alloc] init];
//    dvc.webView = redditWebView;
//    
//    [self.navigationController pushViewController:dvc animated:YES];
//}
//
//- (IBAction)showGoogleNewsPressed:(id)sender {
//    
//    UIWebView *googleNewsWebView = [self.preLoader webViewForKey:@"Google News"];
//    
//    DetailsViewController *dvc = [[DetailsViewController alloc] init];
//    dvc.webView = googleNewsWebView;
//    
//    [self.navigationController pushViewController:dvc animated:YES];
//}




- (IBAction)startLoadingButtonPressed:(id)sender {
    self.preLoader = [[WebViewPreLoader alloc]init];
    
    for(int i = 0; i<100; i++)
    {
       NSString *randomURL = [NSString stringWithFormat:@"http://thecatapi.com/api/images/get?format=src&type=png&blah=%i", i];
    [self.preLoader setURLString:randomURL
                          forKey:[NSNumber numberWithInt:i]
                  withFrameWidth:self.containerView.frame.size.width
                 withFrameLength:self.containerView.frame.size.height];
    
    }
 
    
    
}

- (IBAction)fetchRandomSiteButtonPressed:(id)sender {
    
    [self.containerView.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    
    int randomNumber = arc4random_uniform(100);
    NSLog(@"I chose: %i", randomNumber);
    UIWebView *randomView = [self.preLoader webViewForKey:[NSNumber numberWithInt:randomNumber]];
    
    [self.containerView addSubview:randomView];
    
}
@end
