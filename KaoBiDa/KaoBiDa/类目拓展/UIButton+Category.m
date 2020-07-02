//
//  UIButton+Category.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/25.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

@interface UIButton ()
@property (nonatomic, assign)NSInteger totalCount;
@property (nonatomic, copy) void (^clickBlock)(UIButton *btn);
@end

@implementation UIButton (Category)
#pragma mark -点击UIButton实现倒计时
- (void)showCountDown:(NSInteger)totalCount CountDwonText:(NSString *)countDownText AgainText:(NSString *)againText {
    self.totalCount = totalCount;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(handleTimer:) userInfo:@{@"countDownText":countDownText,@"againText":againText} repeats:YES];
    });
}

- (void)handleTimer:(NSTimer *)sender {
    NSDictionary *userInfo = (NSDictionary *)sender.userInfo;
   
    self.totalCount--;
    if (self.totalCount > 0) {
        NSString *showStr = [((NSString *)userInfo[@"countDownText"]) stringByReplacingOccurrencesOfString:@"%@" withString:[NSString stringWithFormat:@"%ld",self.totalCount]];
        [self setTitle:showStr forState:UIControlStateNormal];
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = DLRGB(187, 187, 187).CGColor;
        self.layer.cornerRadius = 15;
        [self setTitleColor:DLRGB(187, 187, 187) forState:UIControlStateNormal];
    } else {
        [self setTitle:userInfo[@"againText"] forState:UIControlStateNormal];
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = DLRGB(255, 125, 95).CGColor;
        self.layer.cornerRadius = 15;
        [self setTitleColor:DLRGB(255, 125, 95) forState:UIControlStateNormal];
    }
}

- (void)setTotalCount:(NSInteger)totalCount {
    objc_setAssociatedObject(self, @"totalCount", @(totalCount), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)totalCount {
    return [objc_getAssociatedObject(self, @"totalCount") integerValue];
}

#pragma mark -给UIButton添加点击事件，响应在block中实现
- (void)clickBtnBlock:(void (^)(UIButton *btn))clickBlock {
    [self addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
    self.clickBlock = clickBlock;
}

- (void)btnClickAction:(UIButton *)sender {
    self.clickBlock(sender);
}

- (void)setClickBlock:(void (^)(UIButton *))clickBlock {
    objc_setAssociatedObject(self, @"clickBlock", clickBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIButton *btn))clickBlock {
   return objc_getAssociatedObject(self, @"clickBlock");
}
@end
