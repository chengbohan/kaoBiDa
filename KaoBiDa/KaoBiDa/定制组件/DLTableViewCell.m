//
//  DLTableViewCell.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/19.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLTableViewCell.h"

@implementation DLTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUI];
    // Initialization code
}

- (void)setUI {
    //添加背景点击色
    UIView *viewBg = [[UIView alloc] initWithFrame:self.frame];
    viewBg.backgroundColor = [UIColor colorNamed:@"StandardViewBgColor"];
    self.selectedBackgroundView = viewBg;
    
    //cell底部分割线
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorNamed:@"StandardSeparatorLineColor"];
    [self.contentView addSubview:lineView];
    [lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.bottom.equalTo(0);
        make.height.equalTo(1);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
