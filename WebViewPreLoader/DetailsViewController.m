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

        //TEST
        
     //   self.webView = [[UIWebView alloc]init];
       // [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.reddit.com"]]];
        
        
        
       [self.webView setFrame:self.view.bounds];
        self.webView.scalesPageToFit = YES;
        
        [self.view addSubview:self.webView];
    }

    
    // Do any additional setup after loading the view from its nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
