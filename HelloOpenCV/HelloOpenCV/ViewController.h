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

//@property (nonatomic, strong)NSMutableArray *values;
@property (weak, nonatomic) IBOutlet UILabel *heartlabel;
//@property (weak, nonatomic) IBOutlet UIProgressView *measureProgress;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

- (IBAction)actionStart:(id)sender;

- (void) turnOnTorch;

@end
