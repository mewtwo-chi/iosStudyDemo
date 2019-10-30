//
//  ViewController.m
//  ToolbarSample
//
//  Created by bfe on 2019/9/5.
//  Copyright © 2019 bfe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat toolbarHeight = 44;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, (screen.size.height - toolbarHeight)/2, screen.size.width, toolbarHeight)];
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    UIBarButtonItem *openButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"open" style:UIBarButtonItemStylePlain target:self action:@selector(open:)];
    UIBarButtonItem *flexibleButtonItem = [[UIBarButtonItem alloc]  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];

    toolbar.items = @[saveButtonItem, flexibleButtonItem, openButtonItem];
    
    [self.view addSubview:toolbar];
    
    CGFloat labelWidth = 84;
    CGFloat labelHeight = 21;
    CGFloat labelTopView = 250;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    self.label.text = @"label";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)save:(id)sneder{
    self.label.text = @"点击save";
}

- (void)open:(id)sneder{
    self.label.text = @"点击open";
}

@end
