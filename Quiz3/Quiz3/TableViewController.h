//
//  TableViewController.h
//  Quiz3
//
//  Created by qingfeng liu on 10/28/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate>

@property (copy,nonatomic) NSDictionary *stateZips;
@property (copy,nonatomic) NSArray *states;

@end
