//
//  CustomPickerViewController.h
//  Pickers
//
//  Created by qingfeng liu on 10/7/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong,nonatomic) IBOutlet UIPickerView *picker;
@property (strong,nonatomic) IBOutlet UILabel *winLabel;
@property (strong,nonatomic) NSArray *images;
@property (strong,nonatomic) IBOutlet UIButton *button;

-(IBAction)spin;
@end
