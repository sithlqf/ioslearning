//
//  ViewController.m
//  Persistent
//
//  Created by sithlqf on 13-11-18.
//  Copyright (c) 2013年 sithlqf. All rights reserved.
//

#import "ViewController.h"
//#import "FourLines.h"

@interface ViewController ()

@end

static NSString *const kRootKey=@"kRootKey";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        //        NSData *data = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        //        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
        for (int i = 0; i < 4; i++) {
            UITextField *theField = self.lineFields[i];
            theField.text = array[i];
        }
    }
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

//-(void) applicationWillResignActive:(NSNotification *)notification
//{
//    NSString *filePath=[self dataFilePath];
//    NSArray *array=[self.lineFields valueForKey:@"text"];
//    [array writeToFile:filePath atomically:YES];
////    FourLines *fourLines=[[FourLines alloc]init];
////    fourLines.lines=[self.lineFileds valueForKey:@"text"];
//    
////    NSMutableData *data=[[NSMutableData alloc]init];
////    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
////    [archiver encodeObject:fourLines forKey:kRootKey];
////    [archiver finishEncoding];
////    [data writeToFile:filePath atomically:YES];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
}

- (void)applicationWillResignActive:(NSNotification *)notification
{
    NSString *filePath = [self dataFilePath];
    NSArray *array = [self.lineFields valueForKey:@"text"];
    [array writeToFile:filePath atomically:YES];
}


@end
