//
//  NameAndColorCell.m
//  NameAndColorTable
//
//  Created by qingfeng liu on 10/21/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "NameAndColorCell.h"

@implementation NameAndColorCell
{
    UILabel *_nameValue;
    UILabel *_colorValue;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect nameLabelRect=CGRectMake(0, 5, 70, 15);
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:nameLabelRect];
        nameLabel.textAlignment=NSTextAlignmentRight;
        nameLabel.text=@"name";
        nameLabel.font=[UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:nameLabel];
        
        CGRect colorLabelRect=CGRectMake(0, 26, 70, 15);
        UILabel *colorLabel=[[UILabel alloc]initWithFrame:colorLabelRect];
        colorLabel.textAlignment=NSTextAlignmentRight;
        colorLabel.text=@"color";
        colorLabel.font=[UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:colorLabel];
        
        CGRect nameValueRect=CGRectMake(80, 5, 200, 15);
        _nameValue=[[UILabel alloc]initWithFrame:nameValueRect];
        [self.contentView addSubview:_nameValue];
        
        CGRect colorValueRect=CGRectMake(80, 25, 200, 15);
        _colorValue=[[UILabel alloc]initWithFrame:colorValueRect];
        [self.contentView addSubview:_colorValue];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setName:(NSString *)name
{
    if(![name isEqualToString:_name])
    {
        _name=[name copy];
        _nameValue.text=_name;
    }
}

-(void)setColor:(NSString *)color
{
    if(![color isEqualToString:_color])
    {
        _color=color;
        _colorValue.text=_color;
    }
}

@end
