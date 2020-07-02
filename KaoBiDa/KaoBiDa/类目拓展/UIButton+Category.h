//
//  UIButton+Category.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/25.
//  Copyright © 2019 博瀚程. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)
//验证码倒计时
- (void)showCountDown:(NSInteger)totalCount CountDwonText:(NSString *)countDownText AgainText:(NSString *)againText;
//给UIButton添加点击事件，响应在block中实现
- (void)clickBtnBlock:(void (^)(UIButton *btn))clickBlock;
@end

NS_ASSUME_NONNULL_END
