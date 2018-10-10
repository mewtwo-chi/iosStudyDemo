//
//  ViewController.m
//  TouchTracker
//
//  Created by bfe on 2018/10/10.
//  Copyright © 2018年 bfe. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@interface BNRDrawViewController ()

@end

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}


@end
