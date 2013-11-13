//
//  DetailsViewController.m
//  WebViewPreLoader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

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

    if(self.webView)
    {
        NSLog(@"Webview is alive!");
        self.view.contentMode = UIViewContentModeRedraw;

        //TEST
        
     //   self.webView = [[UIWebView alloc]init];
       // [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.reddit.com"]]];
        
        
        NSLog(@"frame is %@", self.view);
        
        
    }

    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillLayoutSubviews {
    
    [self.view.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];

    [self.webView setFrame:self.view.bounds];

    [self.view addSubview:self.webView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
