//
//  UILabel+Category.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/25.
//  Copyright © 2019 博瀚程. All rights reserved.
//

//#import <AppKit/AppKit.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)
//给UILabel添加点击事件，响应在block中实现
-(void)addTapGestureBlock:(void(^)(UILabel *ownLab))clickBlock;
@end

NS_ASSUME_NONNULL_END
