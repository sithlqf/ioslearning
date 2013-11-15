//
//  YellowViewController.m
//  ViewSwitcher
//
//  Created by qingfeng liu on 9/30/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)yellowButtonPressed:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Yellow View Button Pressed" message:@"you pressed the button on the yellow view" delegate:nil cancelButtonTitle:@"yes, did" otherButtonTitles:nil];
    [alert show];
}

@end
