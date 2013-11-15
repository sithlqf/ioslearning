//
//  RootViewController.h
//  ViewSwitcher
//
//  Created by qingfeng liu on 9/30/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlueViewController.h"
#import "YellowViewController.h"

@class BlueViewController;
@class YellowViewController;

@interface RootViewController : UIViewController

@property (strong, nonatomic) BlueViewController *blueViewController;
@property (strong, nonatomic) YellowViewController *yellowViewController;

-(IBAction)switchViews:(id)sender;

@end
