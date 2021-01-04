//
//  CCAssessCollectionViewCell.m
//  Ccreate_iOS
//
//  Created by JackYoung on 2020/12/23.
//  Copyright © 2020 yunchuang. All rights reserved.
//

#import "CCAssessCollectionViewCell.h"

@interface CCAssessCollectionViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CCAssessCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.contentView.backgroundColor = UIColor.whiteColor;
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.contentView.frame.size.height - 30) / 2.0, self.contentView.frame.size.width, 30)];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.titleLabel.textColor = UIColor.blueColor;
    self.titleLabel.text = @"";
}

- (void)setTitleString:(NSString *)titleString {
    if (titleString && ![titleString isEqualToString:@""]) {
        self.titleLabel.text = titleString;
    }
}

@end
