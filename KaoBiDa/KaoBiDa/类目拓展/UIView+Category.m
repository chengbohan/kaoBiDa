//
//  UIView+Category.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "UIView+Category.h"

@interface UIView()
@property (nonatomic, copy) void(^tapBlock)(UIView *ownView);
@end


@implementation UIView (Category)
- (void)addTapGestureBlock:(void (^)(UIView *ownView))clickBlock {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    tap.numberOfTouchesRequired = 1;
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(clickView:)];
    self.tapBlock = clickBlock;
}

- (void)clickView:(UITapGestureRecognizer *)sender {
    self.tapBlock(self);
}

- (void)setTapBlock:(void (^)(UIView *))tapBlock {
    objc_setAssociatedObject(self, @"tapBlock", tapBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIView *))tapBlock {
    return objc_getAssociatedObject(self, @"tapBlock");
}
@end
