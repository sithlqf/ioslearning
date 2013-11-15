//
//  DoubleComponentViewController.m
//  Pickers
//
//  Created by qingfeng liu on 10/7/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "DoubleComponentViewController.h"

@interface DoubleComponentViewController ()

@end

@implementation DoubleComponentViewController

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
	//intialize the NSArray datasource
	self.fillingTypes=@[@"Ham",@"Turkey",@"Peanut Butter",@"Tuna Salad",@"Chicken Salad",@"Roast Beef",@"Vegemite"];
	self.breadTypes=@[@"White",@"Whole Wheat",@"Rye",@"Sourdough",@"Seven Grain"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed
{
	NSInteger fillingRow=[self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow=[self.doublePicker selectedRowInComponent:kBreadComponent];
    
    NSString *filling=self.fillingTypes[fillingRow];
    NSString *bread=self.breadTypes[breadRow];
    
    NSString *message=[[NSString alloc]initWithFormat:@"your %@ on %@ bread will be right up",filling,bread];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Thank you for your order" message:message delegate:nil cancelButtonTitle:@"greate" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark-
#pragma mark Picker Data Source Methods
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==kBreadComponent)
    {
        return [self.breadTypes count];
    }
    else
    {
        return [self.fillingTypes count];
    }
}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==kBreadComponent)
    {
        return self.breadTypes[row];
    }
    else
    {
        return self.fillingTypes[row];
    }
}

@end
