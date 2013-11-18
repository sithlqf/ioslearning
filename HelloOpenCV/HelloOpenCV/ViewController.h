//
//  ViewController.h
//  HelloOpenCV
//
//  Created by sithlqf on 13-11-17.
//  Copyright (c) 2013年 sithlqf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/highgui/cap_ios.h>
//using namespace cv;

@interface ViewController : UIViewController <CvVideoCameraDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, retain) CvVideoCamera* videoCamera;

- (IBAction)actionStart:(id)sender;


@end
