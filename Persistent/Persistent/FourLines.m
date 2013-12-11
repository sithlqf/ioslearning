//
//  FourLines.m
//  Persistent
//
//  Created by sithlqf on 13-11-18.
//  Copyright (c) 2013年 sithlqf. All rights reserved.
//

#import "FourLines.h"

static NSString *const kLineKey=@"kLineKey";

@implementation FourLines

#pragma mark - Coding
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if (self) {
        self.lines=[aDecoder decodeObjectForKey:kLineKey];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.lines forKey:kLineKey];
}

#pragma mark - Copying
-(id) copyWithZone:(NSZone *)zone
{
    FourLines *copy=[[[self class]allocWithZone:zone]init];
    NSMutableArray *linesCopy=[NSMutableArray array];
    for (id line in self.lines) {
        [linesCopy addObject:[line copyWithZone:zone]];
    }
    copy.lines=linesCopy;
    return copy;
}

@end
