//
//  DoubleComponentViewController.h
//  Pickers
//
//  Created by qingfeng liu on 10/7/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0
#define kBreadComponent 1

@interface DoubleComponentViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property(strong, nonatomic) IBOutlet UIPickerView *doublePicker;
@property(strong, nonatomic) NSArray *fillingTypes;
@property(strong, nonatomic) NSArray *breadTypes;

-(IBAction) buttonPressed;

@end
