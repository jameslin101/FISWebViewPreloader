//
//  PresentingViewController.h
//  WebViewPreLoader
//
//  Created by Basar Akyelli on 11/13/13.
//  Copyright (c) 2013 James Lin & Basar Akyelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewPreLoader.h"

@interface PresentingViewController : UIViewController 


@property (weak, nonatomic) IBOutlet UIView *containerView;
- (IBAction)startLoadingButtonPressed:(id)sender;
- (IBAction)fetchRandomSiteButtonPressed:(id)sender;

@end
