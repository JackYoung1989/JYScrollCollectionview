//
//  CCAssessCollectionView.h
//  Ccreate_iOS
//
//  Created by JackYoung on 2020/12/23.
//  Copyright © 2020 yunchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCollecitonViewCellWidth  300

NS_ASSUME_NONNULL_BEGIN

@interface CCAssessCollectionView : UICollectionView<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, copy)NSString *identifier;

@end

NS_ASSUME_NONNULL_END
