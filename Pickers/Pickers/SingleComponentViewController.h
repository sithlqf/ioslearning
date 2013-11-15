//
//  SingleComponentViewController.h
//  Pickers
//
//  Created by qingfeng liu on 10/7/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleComponentViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong,nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong,nonatomic) NSArray *characterNames;
-(IBAction) buttonPressed;

@end
