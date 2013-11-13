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
    [self preLoadWebViews];
    
    [self setTitle:@"Presenting View Controller"];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)preLoadWebViews
{
    self.preLoader = [[WebViewPreLoader alloc]init];
    //self.preLoader.delegate = self;

    [self.preLoader setURLString:@"http://www.reddit.com" forKey:@"Reddit" withFrameWidth:self.view.frame.size.width withFrameLength:self.view.frame.size.height];
    
    
    [self.preLoader setURLString:@"http://www.reddit.com" forKey:@"Google News"];
    [self.preLoader setURLString:@"http://www.cnn.com" forKey:@"CNN"];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showCnnPressed:(id)sender {
    UIWebView *cnnWebView = [self.preLoader webViewForKey:@"CNN"];
    
    DetailsViewController *dvc = [[DetailsViewController alloc] init];
    dvc.webView = cnnWebView;
    
    [self.navigationController pushViewController:dvc animated:YES];
    
}

- (IBAction)showRedditPressed:(id)sender {
    
    UIWebView *redditWebView = [self.preLoader webViewForKey:@"Reddit"];
    
    DetailsViewController *dvc = [[DetailsViewController alloc] init];
    dvc.webView = redditWebView;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

- (IBAction)showGoogleNewsPressed:(id)sender {
    
    UIWebView *googleNewsWebView = [self.preLoader webViewForKey:@"Google News"];
    
    DetailsViewController *dvc = [[DetailsViewController alloc] init];
    dvc.webView = googleNewsWebView;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

#pragma mark WebViewPreLoaderDelegate methods

- (void)preLoadStarted:(UIWebView *)webview forUrlString:(id)urlString
{
    webview.delegate = self;
    NSLog(@"Preloaded webview: %@", webview);
    
}

#pragma mark UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"start loading %@", [self.preLoader keyForWebView:webView]);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"stop loading %@", [self.preLoader keyForWebView:webView]);
}
@end
