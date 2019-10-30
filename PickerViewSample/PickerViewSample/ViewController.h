//
//  ViewController.h
//  PickerViewSample
//
//  Created by bfe on 2019/10/30.
//  Copyright © 2019 bfe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) NSDictionary *pickData; //保存全部数据
@property (strong, nonatomic) NSArray *pickerProvincesData; //当前的省数据
@property (strong, nonatomic) NSArray *pickerCitiesData; //当前省下面的市数据

@end

