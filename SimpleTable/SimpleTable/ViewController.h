//
//  ViewController.h
//  SimpleTable
//
//  Created by qingfeng liu on 10/21/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(copy,nonatomic) NSArray *dwarves;

@end
