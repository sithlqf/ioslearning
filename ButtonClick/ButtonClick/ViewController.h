//
//  ViewController.h
//  ButtonClick
//
//  Created by qingfeng liu on 9/30/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *clickTimesLabel;

- (IBAction)clickButtonAction:(id)sender;

- (IBAction)resetButtonAction:(id)sender;

@end
