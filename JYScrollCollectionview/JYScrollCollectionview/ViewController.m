//
//  ViewController.m
//  JYScrollCollectionview
//
//  Created by JackYoung on 2021/1/4.
//

#import "ViewController.h"
#import "CCAssessCollectionView.h"

@interface ViewController ()

@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 260) / 2.0, 100, 260, 30)];
    titleLabel.text = @"滚动的CollectionViewCell";
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor redColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    self.view.backgroundColor = UIColor.lightGrayColor;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kCollecitonViewCellWidth, 100);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CCAssessCollectionView *collectionView = [[CCAssessCollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 600) collectionViewLayout:layout];
    collectionView.backgroundColor = UIColor.redColor;
    
    self.dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 38; i ++) {
        [self.dataArray addObject:@(i)];
    }
    collectionView.dataArray = self.dataArray;
    [self.view addSubview:collectionView];
}

@end
