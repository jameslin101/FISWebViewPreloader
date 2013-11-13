//
//  TestViewController.m
//  WebViewPreLoader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

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
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.reddit.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    UIWebView *newWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    newWebView.scalesPageToFit = YES;
    
    [newWebView loadRequest:request];
    
    [self.view addSubview:newWebView];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
