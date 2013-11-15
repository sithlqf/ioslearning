//
//  NameAndColorCell.h
//  NameAndColorTable
//
//  Created by qingfeng liu on 10/21/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameAndColorCell : UITableViewCell

@property(copy,nonatomic)NSString *name;
@property(copy,nonatomic)NSString *color;

@property (strong,nonatomic)IBOutlet UILabel *nameValue;
@property (strong,nonatomic)IBOutlet UILabel *colorValue;

@end
