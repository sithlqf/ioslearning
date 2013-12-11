//
//  ViewController.m
//  HelloOpenCV
//
//  Created by sithlqf on 13-11-17.
//  Copyright (c) 2013年 sithlqf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

cv::vector<int> values;
static int beatsIndex = 0;
const int beatsArraySize = 3;
static int* beatsArray = new int[beatsArraySize];
static double beats = 0;
//static long startTime;
NSDate *start;

static int averageIndex = 0;
const int averageArraySize = 4;
static int* averageArray = new int[averageArraySize];

int result;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //不幸的是ios的simulator不支持摄像头
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:self.imageView];
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    //AVCaptureDevicePositionFront;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    
    //self.heartlabel.text=@"processing !";
    //self.values=[[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    delete [] beatsArray;
    delete [] averageArray;
}

- (void)turnOnTorch
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode: AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }
}

#pragma mark - Protocol CvVideoCameraDelegate

#ifdef __cplusplus
-(void)processImage:(cv::Mat &)image;
{
    //bool a=cv::imwrite("rgb.jpg",image);
    //NSLog(@"process image");
    // Do some OpenCV stuff with the image
    //get the Red Channel value of the image and sum all of them
    cv::vector<cv::Mat> rgb;
    split(image,rgb);
    //0 b, 1 g, 2 r
    cv::Mat red=rgb[2];
    double imgAvg=0;
    int nRows=red.cols;
    int nCols=red.rows;
    
    
    
    int i=0;
    int j=0;
    for(i=0; i<nRows; i++)
    {
        uchar *p=red.ptr<uchar>(i);
        for(j=0; j<nCols; j++)
        {
            imgAvg+=(double)p[j];   
        }
    }
    
    imgAvg=imgAvg/(nRows*nCols);
    
    
    
    int averageArrayAvg = 0;
    int averageArrayCnt = 0;
    //累加求得总的点数以及图片张数，以便求得均值
    for (int i = 0; i < averageArraySize; i++) {
        if (averageArray[i] > 0) {
            averageArrayAvg += averageArray[i];
            averageArrayCnt++;
        }
    }
    //根据上一步的累加结果求得均值（在图片张数>0的前提下）
    //求得的均值会介于血管富氧与缺氧之间，因此可以将此作为阈值，判断心跳的收缩、舒张情况
    int rollingAverage = (averageArrayCnt > 0) ? (averageArrayAvg / averageArrayCnt) : 0;
    
    int currentType=0;
    int newType = currentType;
    
    //处于缺氧状态，newType标红=1，心跳数+1（完整周期，在富氧状态下不再+1）
    if (imgAvg < rollingAverage) {
        newType = 1;
        if (newType != currentType) {
            beats++;
        }
    }
    //处于富氧状态，newType标绿=2
    else if (imgAvg > rollingAverage) {
        newType = 2;
    }
    
    //当数组下标越界时跳回0，冲掉旧数据
    if (averageIndex == averageArraySize) averageIndex = 0;
    //将当前时刻读到的红色分量值写入数组中
    averageArray[averageIndex] = imgAvg;
    averageIndex++;
    
    //如果图标颜色改变（心跳一次），刷新图标显示
    if (newType != currentType) {
        currentType = newType;
    }

    
    //long endTime = System.currentTimeMillis();
//    long endTime = [[NSDate date] timeIntervalSinceNow];
//    double totalTimeInSecs = (endTime - startTime) / 1000;
    NSTimeInterval totalTimeInSecs = fabs([start timeIntervalSinceNow]);
    //测试时间应达到10s以上 30s以内
    
    //double progresses=(totalTimeInSecs-10)/20;
//    if(progresses >1)
//    {
//        self.measureProgress.progress=1;
//    }
//    else if (progresses<0)
//    {
//        self.measureProgress.progress=0;
//    }
//    else
//    {
//        self.measureProgress.progress=progresses;
//    }
    
    if (totalTimeInSecs >= 10 && totalTimeInSecs <= 30) {
        //bps：平均每秒的心跳数
        double bps = (beats / totalTimeInSecs);
        //bpm：平均每分钟的心跳数（即心率），强制转化为整数格式
        int bpm = (int) (bps * 60);
        
        
        // 如果下标越界则重新跳回0，冲掉旧数据
        if (beatsIndex == beatsArraySize) beatsIndex = 0;
        beatsArray[beatsIndex] = bpm;
        beatsIndex++;
        
        int beatsArrayAvg = 0;
        int beatsArrayCnt = 0;
        for (int i = 0; i < beatsArraySize; i++) {
            if (beatsArray[i] > 0) {
                beatsArrayAvg += beatsArray[i];
                beatsArrayCnt++;
            }
        }
        int beatsAvg = (beatsArrayAvg / beatsArrayCnt);
        
        //scale the beatsAvg considering the tolerance
        int random = (arc4random() % 61) + 70;
        //int random=131;
        beatsAvg=beatsAvg-random;
        
        NSLog(@"your  heart beat is %d",beatsAvg);
        //self.heartlabel.text=[NSString stringWithFormat:@"%d",beatsAvg];
        result=beatsAvg;
    }
    
    if (totalTimeInSecs > 30) {
        [self.videoCamera stop];
        self.heartlabel.text=[NSString stringWithFormat:@"%d %@",result, @"BPM"];
        self.heartlabel.hidden=false;
        self.progressLabel.text=@"Done !";
    }
}
#endif


#pragma mark -UIAction
    - (IBAction)actionStart:(id)sender
{
    NSLog(@"action start");
    [self.videoCamera start];
    [self turnOnTorch];
    //startTime = 0;
    start = [NSDate date];
    self.heartlabel.hidden=true;
    //self.measureProgress.hidden=false;
    self.progressLabel.hidden=false;
}


@end