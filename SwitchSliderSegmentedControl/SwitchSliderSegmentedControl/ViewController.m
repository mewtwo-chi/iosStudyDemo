//
//  ViewController.m
//  SwitchSliderSegmentedControl
//
//  Created by bfe on 2019/8/29.
//  Copyright © 2019 bfe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UISwitch *rightSwitch;
@property (strong, nonatomic) UISwitch *leftSwitch;
@property (strong, nonatomic) UILabel *sliderValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat switchScreenSpace = 39;
    
    self.rightSwitch = [[UISwitch alloc] init];
    CGRect frame = self.rightSwitch.frame;
    frame.origin = CGPointMake(switchScreenSpace, 98);
    // 重新设置控件位置
    self.rightSwitch.frame = frame;
    // 设置控件状态
    self.rightSwitch.on = TRUE;
    
    [self.rightSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.rightSwitch];
    
    self.leftSwitch = [[UISwitch alloc] init];
    frame = self.leftSwitch.frame;
    frame.origin = CGPointMake(screen.size.width-(frame.size.width + switchScreenSpace), 98);
    self.leftSwitch.frame = frame;
    self.leftSwitch.on = TRUE;
    [self.leftSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.leftSwitch.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.leftSwitch];
    
    NSArray *segments = @[@"Right", @"Left"];
    UISegmentedControl *segmentControl =  [[UISegmentedControl alloc] initWithItems:segments];
    
    CGFloat scWidth = 220;
    CGFloat scHeight = 29;
    CGFloat scTopView = 186;
    
}

- (void)switchValueChanged:(id)sender{
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    [self.leftSwitch setOn:setting animated:TRUE];
    [self.rightSwitch setOn:setting animated:TRUE];
}


@end
