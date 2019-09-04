//
//  ViewController.m
//  AlertViewActionSheet
//
//  Created by bfe on 2019/9/3.
//  Copyright © 2019 bfe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    UIButton *buttonAlertView = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonAlertView setTitle:@"TEST 警告框" forState:UIControlStateNormal];
    
    CGFloat buttonAlertViewWidth = 100;
    CGFloat buttonAlertViewHeight = 30;
    CGFloat buttonAlertTopView = 130;
    
    buttonAlertView.frame = CGRectMake((screen.size.width - buttonAlertViewWidth)/2, buttonAlertTopView, buttonAlertViewWidth, buttonAlertViewHeight);
    [buttonAlertView addTarget:self action:@selector(testAlertView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonAlertView];
    
    
    UIButton *buttonActionSheet = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonActionSheet setTitle:@"test操作表" forState:UIControlStateNormal];
    
    CGFloat buttonActionSheetWidth = 100;
    CGFloat buttonActionSheetHeight = 30;
    CGFloat buttonActionSheetTopView = 260;
    
    buttonActionSheet.frame = CGRectMake((screen.size.width - buttonActionSheetWidth)/2, buttonActionSheetTopView, buttonActionSheetWidth, buttonActionSheetHeight);
    [buttonActionSheet addTarget:self action:@selector(testActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonActionSheet];
}

- (void)testAlertView:(id)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Alert text goes here" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"Top No Button");
    }];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Top Yes Button");
    }];
    
    UIAlertAction *yesAction1 = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"Top Yes Button");
    }];
    
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
    [alertController addAction:yesAction1];
    
    [self presentViewController:alertController animated:true completion:nil];
}

-(void)testActionSheet:(id)sneder{
    UIAlertController *actionSheetController = [[UIAlertController alloc] init];
    
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"Top No Button");
    }];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"Top Yes Button");
    }];
    
    UIAlertAction *yesAction1 = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"Top Yes Button");
    }];
    
    [actionSheetController addAction:noAction];
    [actionSheetController addAction:yesAction];
    [actionSheetController addAction:yesAction1];
    
    [self presentViewController:actionSheetController animated:true completion:nil];
}


@end
