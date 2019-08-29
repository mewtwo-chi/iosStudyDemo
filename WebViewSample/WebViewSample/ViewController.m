//
//  ViewController.m
//  WebViewSample
//
//  Created by bfe on 2019/8/29.
//  Copyright © 2019 bfe. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKNavigationDelegate>

@property(nonatomic, strong) WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat buttonBarWidth = 316;
    UIView *buttonBar = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width - buttonBarWidth)/2, 20, buttonBarWidth, 30)];
    [self.view addSubview:buttonBar];
    
    UIButton *buttonLoadHtmlString = [UIButton buttonWithType:UIButtonTypeSystem];
    
}


@end

