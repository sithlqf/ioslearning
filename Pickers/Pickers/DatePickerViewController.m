//
//  DatePickerViewController.m
//  Pickers
//
//  Created by qingfeng liu on 10/7/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

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
    // Do any additional setup after loading the view from its nib.
    //set the current date of the datepicker
    NSDate *now=[NSDate date];
    [self.datePicker setDate:now animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSDate *selected=[self.datePicker date];
    
    //make the time appeared as local time
    NSTimeZone *zone=[NSTimeZone systemTimeZone];
    NSInteger interval=[zone secondsFromGMTForDate:selected];
    NSDate *localeDate=[selected dateByAddingTimeInterval:interval];
    
    NSString *message=[[NSString alloc]initWithFormat:@"The date and time you selected is %@",localeDate];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Date and Time Selected" message:message delegate:nil cancelButtonTitle:@"yes i did" otherButtonTitles:nil, nil];
    [alert show];
}
@end
