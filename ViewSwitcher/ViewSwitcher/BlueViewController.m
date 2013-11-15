//
//  BlueViewController.m
//  ViewSwitcher
//
//  Created by qingfeng liu on 9/30/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

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

-(IBAction)blueButtonPressed:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Blue View Button Pressed" message:@"You pressed the button on the Blue View" delegate: nil cancelButtonTitle:@"Yes, I did" otherButtonTitles:nil];
    [alert show];
    
}

@end
