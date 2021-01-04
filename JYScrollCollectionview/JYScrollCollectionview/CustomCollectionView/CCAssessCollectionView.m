//
//  CCAssessCollectionView.m
//  Ccreate_iOS
//
//  Created by JackYoung on 2020/12/23.
//  Copyright © 2020 yunchuang. All rights reserved.
//

#import "CCAssessCollectionView.h"
#import "CCAssessCollectionViewCell.h"

@interface CCAssessCollectionView()<UIScrollViewDelegate>

@property (nonatomic, assign)CGFloat oldY;

@end

@implementation CCAssessCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[CCAssessCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CCAssessCollectionViewCell class])];
    self.backgroundColor = UIColor.blackColor;
}

#pragma mark ====== UICollectionViewDelegate ======
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CCAssessCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CCAssessCollectionViewCell class]) forIndexPath:indexPath];
    cell.titleString = [NSString stringWithFormat:@"第%ld个cell",(long)indexPath.row];
    return cell;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self reloadData];
}

//控制每次滑动都只滑动一个cell的宽度
#pragma mark ====== UIScrollViewDelegate ======
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _oldY = scrollView.contentOffset.x;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self scrollViewHandleScrollWithScrollView:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self scrollViewHandleScrollWithScrollView:scrollView];
}

//处理collectionView滑动到那一个cell
- (void)scrollViewHandleScrollWithScrollView:(UIScrollView *)scrollView {
    CGFloat newY = scrollView.contentOffset.x;
    NSInteger page = 0;
    if (newY > _oldY && newY - _oldY > 20) {// 左滑
        page = (newY + 0.9 * kCollecitonViewCellWidth) / kCollecitonViewCellWidth;
    } else if (newY < _oldY && _oldY - newY > 20) {// 右滑
        page = (newY + 0.1 * kCollecitonViewCellWidth)/ kCollecitonViewCellWidth;
    }
    
    NSInteger row = page * 5;
    if (row >= _dataArray.count) {
        row = _dataArray.count - 1;
    }
    [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:true];
}

@end
