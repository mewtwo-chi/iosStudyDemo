//
//  ViewController.m
//  CollectionViewSample
//
//  Created by bfe on 2019/11/27.
//  Copyright © 2019 bfe. All rights reserved.
//

#import "ViewController.h"
#import "EventCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    int COL_NUM; // 每一个行有几个单元格
}

@property (strong, nonatomic) NSArray *events;
@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"event" ofType:@"plist"];
    
    self.events = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    COL_NUM = 2;
    
    [self setupCollectionView];

}

-(void)setupCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置每个单元格尺寸
    layout.itemSize = CGSizeMake(150, 150);
    // 设置整个collectionView的内边距
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 设置每一行之间的间距
    layout.minimumLineSpacing = 10;
    // 设置单元格之间的间距
    layout.minimumInteritemSpacing = 10;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    [self.collectionView registerClass:[EventCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
}


@end
