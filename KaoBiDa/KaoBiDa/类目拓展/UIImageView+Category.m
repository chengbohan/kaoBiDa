//
//  UIImageView+Category.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "UIImageView+Category.h"


@interface UIImageView()
@property(nonatomic, copy) void(^tapBlock)(UIImageView *ownImg);
@end


@implementation UIImageView (Category)
- (void)addTapGestureBlock:(void (^)(UIImageView *ownImg))clickBlock {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    tap.numberOfTouchesRequired = 1;
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(clickImg:)];
    self.tapBlock = clickBlock;
}

- (void)clickImg:(UITapGestureRecognizer *)sender {
    self.tapBlock(self);
}

- (void)setTapBlock:(void (^)(UIImageView *))tapBlock {
    objc_setAssociatedObject(self, @"tapBlock", tapBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIImageView *))tapBlock {
    return objc_getAssociatedObject(self, @"tapBlock");
}


@end
