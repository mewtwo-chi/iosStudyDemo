//
//  ViewController.m
//  UploadDownload
//
//  Created by bfe on 2019/9/4.
//  Copyright © 2019 bfe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIActivityIndicatorView *activityindicatorView;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    // 实例化loading
    self.activityindicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = self.activityindicatorView.frame;
    frame.origin = CGPointMake((screen.size.width - frame.size.width)/2, 84);
    self.activityindicatorView.frame = frame;
    self.activityindicatorView.frame = frame;
    self.activityindicatorView.hidesWhenStopped = false;
    [self.view addSubview:self.activityindicatorView];
    
    UIButton *buttonUpload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonUpload setTitle:@"Upload" forState:UIControlStateNormal];
    CGFloat buttonUploadWidth = 50;
    CGFloat buttonUploadHeight = 30;
    CGFloat buttonUploadTopView = 190;
    buttonUpload.frame = CGRectMake((screen.size.width - buttonUploadWidth)/2, buttonUploadTopView, buttonUploadWidth, buttonUploadHeight);
    [buttonUpload addTarget:self action:@selector(startToMove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonUpload];
    
    CGFloat progressViewWidth = 200;
    CGFloat progressViewHeight = 2;
    CGFloat progressViewTopView = 283;
    //实例化进度条
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake((screen.size.width - progressViewWidth)/2 , progressViewTopView, progressViewWidth, progressViewHeight)];
    [self.view addSubview: self.progressView];
    
    UIButton *buttonDownload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonDownload setTitle:@"Download" forState:UIControlStateNormal];
    CGFloat buttonDownloadWidth = 69;
    CGFloat buttonDownloadHeight = 30;
    CGFloat buttongDownTopView = 384;
    buttonDownload.frame = CGRectMake((screen.size.width - buttonUploadWidth)/2, buttongDownTopView, buttonDownloadWidth, buttonDownloadHeight);
    [buttonDownload addTarget:self action:@selector(downloadProgress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDownload];
    
}

- (void)startToMove:(id)sender{
    if([self.activityindicatorView isAnimating]){
        [self.activityindicatorView stopAnimating];
    }else{
        [self.activityindicatorView startAnimating];
    }
}

- (void)downloadProgress:(id)sender{
    
    // 在给定的时间间隔调用指定方法 - scheduledTimerWithTimeInterval：时间间隔；target：指定消息发送给的对象；selector：调用的方法；userInfo：给消息发送参数；repeats：是否重复；
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:TRUE];
}

- (void)download{
    self.progressView.progress = self.progressView.progress + 0.1;
    if(self.progressView.progress == 1.0){
        // 完成任务后结束定时器
        [self.timer invalidate];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"donwload complete!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:true completion:nil];
    }
}

@end
