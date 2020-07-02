//
//  UILabel+Category.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/25.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "UILabel+Category.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface UILabel()
@property(nonatomic, copy) void(^tapBlock)(UILabel *ownLab);
@end

@implementation UILabel (Category)
#pragma mark -给UILabel添加点击事件，响应在block中实现
-(void)addTapGestureBlock:(void(^)(UILabel *ownLab))clickBlock {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(clickLab:)];
    self.tapBlock = clickBlock;
}

- (void)clickLab:(UITapGestureRecognizer *)sender {
    self.tapBlock(self);
}

- (void)setTapBlock:(void (^)(UILabel *))tapBlock {
    objc_setAssociatedObject(self, @"tapBlock", tapBlock, OBJC_ASSOCIATION_COPY);
}

- (void(^)(UILabel *ownLab))tapBlock {
    return objc_getAssociatedObject(self, @"tapBlock");
}


@end
