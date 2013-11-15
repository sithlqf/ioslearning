//
//  DependentComponentViewController.m
//  Pickers
//
//  Created by qingfeng liu on 10/7/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "DependentComponentViewController.h"

@interface DependentComponentViewController ()

@end

@implementation DependentComponentViewController

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
    
    //intialize NSDictionary and NSArray datasource
    NSBundle *bundle=[NSBundle mainBundle];
    NSURL *plistURL=[bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    self.stateZips=[NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    //intialize and sort the states
    NSArray *allStates=[self.stateZips allKeys];
    NSArray *sortedStates=[allStates sortedArrayUsingSelector:@selector(compare:)];
    self.states=sortedStates;
    
    //intialize zips according to the first states
    NSString *selectedState=self.states[0];
    self.zips=self.stateZips[selectedState];
    [self.dependentPicker selectRow:2 inComponent:kZipComponent animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed
{
    NSInteger stateRow=[self.dependentPicker selectedRowInComponent:kStateComponent];
    NSInteger zipRow=[self.dependentPicker selectedRowInComponent:kZipComponent];
    
    NSString *state=self.states[stateRow];
    NSString *zip=self.zips[zipRow];
    
    NSString *title=[[NSString alloc]initWithFormat:@"you selected zip code %@",zip ];
    NSString *message=[[NSString alloc]initWithFormat:@"%@ is in %@",zip,state];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


#pragma mark -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==kStateComponent)
        return [self.states count];
    else
        return [self.zips count];
}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==kStateComponent) {
        return self.states[row];
    }
    else
    {
        return self.zips[row];
    }
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==kStateComponent) {
        NSString *selectedState=self.states[row];
        self.zips=self.stateZips[selectedState];
        [self.dependentPicker reloadComponent:kZipComponent];
        [self.dependentPicker selectRow:2 inComponent:kZipComponent animated:YES];
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component==kZipComponent) {
        return 90;
    }
    else
    {
        return 200;
    }
}
@end
























