//
//  ViewController.m
//  ControlFun
//
//  Created by qingfeng liu on 9/23/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.sliderLabel.text=@"50";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
    
}

-(IBAction)backgroundTap:(id)sender
{
    [sender resignFirstResponder];
    [sender resignFirstResponder];
    
}

- (IBAction)sliderChanged:(UISlider *)sender {
    int progress=lroundf(sender.value);
    self.sliderLabel.text=[NSString stringWithFormat:@"%d",progress];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting=sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}

- (IBAction)toggleControls:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex==0)
    {
        self.leftSwitch.hidden=NO;
        self.rightSwitch.hidden=NO;
        self.doSomethingButton.hidden=YES;
        
    }
    else
    {
        self.leftSwitch.hidden=YES;
        self.rightSwitch.hidden=YES;
        self.doSomethingButton.hidden=NO;
    }

}

-(IBAction)buttonPressed:(id)sender
{
    UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:@"Are you sure?" delegate:self cancelButtonTitle:@"No Way!" destructiveButtonTitle:@"Yes, I'am Sure!" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex!=[actionSheet cancelButtonIndex])
    {
        NSString *msg=nil;
        if(self.nameField.text.length>0)
        {
            msg=[NSString stringWithFormat:@"you can breath easy,%@, everything went OK.",self.nameField.text];
        }
        else
            msg=@"you can breath easy, everything went ok.";
            
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"something was done" message:msg delegate:self cancelButtonTitle:@"phew" otherButtonTitles:nil];
        [alert show];
    }
    
}
@end
