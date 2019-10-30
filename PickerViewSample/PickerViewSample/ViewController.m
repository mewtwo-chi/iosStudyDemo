//
//  ViewController.m
//  PickerViewSample
//
//  Created by bfe on 2019/10/30.
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
    
    CGFloat pickerViewWidth = 320;
    CGFloat pickerViewHeight = 162;
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, pickerViewWidth, pickerViewHeight)];
    
    [self.view addSubview:self.pickerView];
}


@end
