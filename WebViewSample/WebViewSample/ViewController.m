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
    UIView *buttonBar = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width - buttonBarWidth)/2, 60, buttonBarWidth, 30)];
    [self.view addSubview:buttonBar];
    
    UIButton *buttonLoadHtmlString = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonLoadHtmlString setTitle:@"LoadHTMLString" forState:UIControlStateNormal];
    buttonLoadHtmlString.frame = CGRectMake(0, 0, 117, 30);
    [buttonLoadHtmlString addTarget:self action:@selector(testLoadHTMLString:) forControlEvents:(UIControlEventTouchUpInside)];
    [buttonBar addSubview:buttonLoadHtmlString];
    
    UIButton *buttonLoadData = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonLoadData setTitle:@"LoadData" forState:UIControlStateNormal];
    buttonLoadData.frame = CGRectMake(137, 0, 67, 30);
    [buttonLoadData addTarget:self action:@selector(testLoadData:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBar addSubview:buttonLoadData];
    
    UIButton *buttonLoadRequest = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonLoadRequest setTitle:@"LoadRequest" forState:UIControlStateNormal];
    buttonLoadRequest.frame = CGRectMake(224, 0, 92, 30);
    [buttonLoadRequest addTarget:self action:@selector(testLoadRequest:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBar addSubview:buttonLoadRequest];
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 100, screen.size.width, screen.size.height-80)];
    [self.view addSubview:self.webView];
    
}

- (void)testLoadHTMLString:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSError *error = nil;
    
    NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:&error];
    
    if(error == nil){
        [self.webView loadHTMLString:html baseURL:bundleUrl];
    }
}

- (void)testLoadData:(id)sender {
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSData *htmlData = [[NSData alloc] initWithContentsOfFile:htmlPath];
    
    [self.webView loadData:htmlData MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:bundleUrl];
    
}

- (void)testLoadRequest:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.navigationDelegate = self;
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"开始加载");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"内容开始返回");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"加载完成");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"加载失败 error：%@", error.description);
}

@end

