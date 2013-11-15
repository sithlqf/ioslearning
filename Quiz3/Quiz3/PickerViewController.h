//
//  PickerViewController.h
//  Quiz3
//
//  Created by qingfeng liu on 10/28/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStateComponent 0
#define kZipComponent 1

@interface PickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>


@property (strong,nonatomic) IBOutlet UIPickerView *dependentPicker;
@property (strong,nonatomic) NSDictionary *stateZips;
@property (strong,nonatomic) NSArray *states;
@property (strong,nonatomic) NSArray *zips;
@end
