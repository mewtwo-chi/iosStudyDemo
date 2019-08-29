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
    frame = CGRectMake((screen.size.width - scWidth)/2, scTopView, scWidth, scHeight);
    segmentControl.frame = frame;
    [segmentControl addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentControl];
    
    CGFloat sliderWidth = 300;
    CGFloat sliderHeight = 31;
    CGFloat sliderdTopView = 298;
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((screen.size.width - sliderWidth)/2, sliderdTopView, sliderWidth, sliderHeight)];
    
    slider.minimumValue = 0.0f;
    slider.maximumValue = 100.0f;
    slider.value = 50.00f;
    
    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    CGFloat labelSliderValueSliderSpace = 30;
    UILabel *labelSliderValue = [[UILabel alloc] initWithFrame:CGRectMake(slider.frame.origin.x, slider.frame.origin.y - labelSliderValueSliderSpace, 103, 21)];
    labelSliderValue.text = @"SliderValue:";
    [self.view addSubview:labelSliderValue];
    
    self.sliderValue = [[UILabel alloc] initWithFrame:CGRectMake(labelSliderValue.frame.origin.x + 120, labelSliderValue.frame.origin.y, 50, 21)];
    self.sliderValue.text = @"50";
    [self.view addSubview:self.sliderValue];
}

- (void)switchValueChanged:(id)sender{
    UISwitch *witchSwitch = (UISwitch *)sender;
    BOOL setting = witchSwitch.isOn;
    [self.leftSwitch setOn:setting animated:TRUE];
    [self.rightSwitch setOn:setting animated:TRUE];
}

- (void)touchDown:(id)sender {
    UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
    NSLog(@"选择的段 ：%li", segmentControl.selectedSegmentIndex);
    
    if(self.leftSwitch.hidden){
        self.rightSwitch.hidden = FALSE;
        self.leftSwitch.hidden = FALSE;
    } else {
        self.rightSwitch.hidden = TRUE;
        self.leftSwitch.hidden = TRUE;
    }
    
}
     
 - (void)sliderValueChange:(id)sender{
     UISlider *slider = (UISlider *)sender;
     int progressAsInt = (int)(slider.value);
     NSString *newText = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
     NSLog(@"滑块的值：%@", newText);
     self.sliderValue.text = newText;
 }


@end
