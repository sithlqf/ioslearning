//
//  ViewController.m
//  ButtonClick
//
//  Created by qingfeng liu on 9/30/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSInteger count;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    count=0;
    self.clickTimesLabel.text=[NSString stringWithFormat:@"%d",count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButtonAction:(id)sender {
    count++;
    self.clickTimesLabel.text=[NSString stringWithFormat:@"%d",count];
}

- (IBAction)resetButtonAction:(id)sender {
    count=0;
    self.clickTimesLabel.text=[NSString stringWithFormat:@"%d",count];
}
@end
