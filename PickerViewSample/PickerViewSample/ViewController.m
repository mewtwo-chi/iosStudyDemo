//
//  ViewController.m
//  PickerViewSample
//
//  Created by bfe on 2019/10/30.
//  Copyright © 2019 bfe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) NSDictionary *pickerData; //保存全部数据
@property (strong, nonatomic) NSArray *pickerProvincesData; //当前的省数据
@property (strong, nonatomic) NSArray *pickerCitiesData; //当前省下面的市数据

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    
    //获取属性列表文件中的全部数据
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.pickerData = dict;
    
    //省份名数据
    self.pickerProvincesData = [self.pickerData allKeys];
    
    // 默认取出第一个省的所有市的数据
    NSString *seletedProvince = [self.pickerProvincesData objectAtIndex:0];
    self.pickerCitiesData = [self.pickerData objectForKey:seletedProvince];
    
    NSLog(@"测试%@",seletedProvince);
    NSLog(@"...%@", dict);
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat pickerViewWidth = 320;
    CGFloat pickerViewHeight = 162;
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, pickerViewWidth, pickerViewHeight)];
    
    [self.view addSubview:self.pickerView];
    
    //添加标签
    CGFloat labelWidth = 200;
    CGFloat labelHeight = 21;
    CGFloat labelTopView = 273;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    self.label.text = @"Label";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    
    CGFloat buttonWidth = 46;
    CGFloat buttonHeight = 30;
    CGFloat buttonTopView = 374;
    button.frame = CGRectMake((screen.size.width - buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    [button addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

-(void)onclick:(id)sender {
    NSInteger row1 = [self.pickerView selectedRowInComponent:0];
    NSInteger row2 = [self.pickerView selectedRowInComponent:1];
    NSString *selected1 = [self.pickerProvincesData objectAtIndex:row1];
    NSString *selected2 = [self.pickerCitiesData objectAtIndex:row2];
    
    NSString *title = [[NSString alloc] initWithFormat:@"%@,%@市", selected1, selected2];
    self.label.text = title;
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView //为选择器中拨轮的数目
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component //为选择器中某个拨轮的行数
{
    if(component == 0) {
        return [self.pickerProvincesData count];
    } else {
        return [self.pickerCitiesData count];
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component //为选择器中的某个拨轮的行提供显示数据
{
    if(component == 0){
        return [self.pickerProvincesData objectAtIndex:row];
    } else {
        return [self.pickerCitiesData objectAtIndex:row];
    }
}


@end
